using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.SanctionsScreening
{
    /// <summary>
    /// Query options for the Sanctions Screening API
    /// </summary>
    public class SanctionsScreeningQueryOptions
    {
        /// <summary>
        /// The person or company name to screen (3-300 characters, at most 15 words)
        /// </summary>
        [JsonProperty("name")]
        public string Name { get; set; }

        /// <summary>
        /// Minimum match score to return, between 0.5 and 1. Lower catches more names but returns more false positives. Values outside the range are clamped to 0.5 or 1
        /// </summary>
        [JsonProperty("threshold")]
        public double? Threshold { get; set; }

        /// <summary>
        /// Maximum number of matches to return (1-50; values outside the range are clamped)
        /// </summary>
        [JsonProperty("limit")]
        public double? Limit { get; set; }

        /// <summary>
        /// Restrict screening to one entry type: individual, entity, vessel or aircraft. Any other value is ignored and every type is screened
        /// </summary>
        [JsonProperty("type")]
        public string Type { get; set; }

        /// <summary>
        /// Comma-separated list codes to screen (ofac_sdn, ofac_cons, un, eu, uk). Omit to screen every list. Unknown codes are ignored, and if none of the codes is valid every list is screened
        /// </summary>
        [JsonProperty("lists")]
        public string Lists { get; set; }
    }
}
