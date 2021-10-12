using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using Newtonsoft.Json;
using PayFutureAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PayFutureAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MerchantsController : ControllerBase
    {
        private readonly PayFutureContext _db;
        private readonly IMemoryCache _memoryCache;
        public MerchantsController(PayFutureContext dbContext, IMemoryCache memoryCache)
        {
            _db = dbContext;
            _memoryCache = memoryCache;
        }


        // GET: MerchantsController

        [HttpGet]
        public IActionResult Get(int id)
        {
            string key = string.Format("merchant_{0}", id);
            if(!_memoryCache.TryGetValue(key, out List<Merchant> merchantData))
            {
                List<Merchant> merchant;
                string sql = string.Format("EXEC usp_GetMerchant {0}", id);
                merchantData = _db.Merchants.FromSqlRaw<Merchant>(sql).ToList();

                var cacheOptions = new MemoryCacheEntryOptions() { 
                    Priority = CacheItemPriority.High,
                    AbsoluteExpiration = DateTime.Now.AddMinutes(30),
                    Size= 128
                };

                _memoryCache.Set(key, merchantData, cacheOptions);

                return Ok(merchantData);
            }


            return Ok(merchantData);

        }

       
    }
}
