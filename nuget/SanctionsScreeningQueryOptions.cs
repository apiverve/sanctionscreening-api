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
        /// The person or company name to screen (minimum 3 characters)
        /// </summary>
        [JsonProperty("name")]
        public string Name { get; set; }

        /// <summary>
        /// Minimum match score to return, between 0.5 and 1. Lower catches more names but returns more false positives
        /// </summary>
        [JsonProperty("threshold")]
        public double? Threshold { get; set; }

        /// <summary>
        /// Maximum number of matches to return (1-50)
        /// </summary>
        [JsonProperty("limit")]
        public double? Limit { get; set; }

        /// <summary>
        /// Restrict screening to one entry type
        /// </summary>
        [JsonProperty("type")]
        public string Type { get; set; }
    }
}
