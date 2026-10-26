Sanctions Screening API
============

Sanctions Screening is an OFAC API that checks a person, company or vessel name against the US Treasury OFAC SDN and Consolidated lists, the UN Security Council Consolidated List, the EU consolidated financial sanctions list and the UK Sanctions List. It returns scored JSON matches with the list each hit came from, aliases, dates of birth, addresses and sanctions programs so you can decide whether to block or review.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.SanctionsScreening.svg)](https://www.nuget.org/packages/APIVerve.API.SanctionsScreening)

This is a .NET wrapper for the [Sanctions Screening API](https://apiverve.com/marketplace/sanctionscreening?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.SanctionsScreening
```

Using the Package Manager:
```
nuget install APIVerve.API.SanctionsScreening
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.SanctionsScreening
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.SanctionsScreening"
5. Click on the APIVerve.API.SanctionsScreening package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the Sanctions Screening API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.SanctionsScreening;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new SanctionsScreeningAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SanctionsScreeningQueryOptions {
            Name = "Banco Nacional de Cuba",
            Threshold = 0.85,
            Limit = 10,
            Type = "individual",
            Lists = "ofac_sdn,un,eu,uk"
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The Sanctions Screening API documentation is found here: [https://docs.apiverve.com/ref/sanctionscreening](https://docs.apiverve.com/ref/sanctionscreening?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
Sanctions Screening API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new SanctionsScreeningAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.SanctionsScreening;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new SanctionsScreeningAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SanctionsScreeningQueryOptions {
            Name = "Banco Nacional de Cuba",
            Threshold = 0.85,
            Limit = 10,
            Type = "individual",
            Lists = "ofac_sdn,un,eu,uk"
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.SanctionsScreening;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new SanctionsScreeningAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SanctionsScreeningQueryOptions {
            Name = "Banco Nacional de Cuba",
            Threshold = 0.85,
            Limit = 10,
            Type = "individual",
            Lists = "ofac_sdn,un,eu,uk"
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.SanctionsScreening;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new SanctionsScreeningAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SanctionsScreeningQueryOptions {
            Name = "Banco Nacional de Cuba",
            Threshold = 0.85,
            Limit = 10,
            Type = "individual",
            Lists = "ofac_sdn,un,eu,uk"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.SanctionsScreening;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new SanctionsScreeningAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new SanctionsScreeningQueryOptions {
            Name = "Banco Nacional de Cuba",
            Threshold = 0.85,
            Limit = 10,
            Type = "individual",
            Lists = "ofac_sdn,un,eu,uk"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new SanctionsScreeningAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new SanctionsScreeningQueryOptions {
    Name = "Banco Nacional de Cuba",
    Threshold = 0.85,
    Limit = 10,
    Type = "individual",
    Lists = "ofac_sdn,un,eu,uk"
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new SanctionsScreeningAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new SanctionsScreeningQueryOptions {
    Name = "Banco Nacional de Cuba",
    Threshold = 0.85,
    Limit = 10,
    Type = "individual",
    Lists = "ofac_sdn,un,eu,uk"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new SanctionsScreeningAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new SanctionsScreeningQueryOptions {
    Name = "Banco Nacional de Cuba",
    Threshold = 0.85,
    Limit = 10,
    Type = "individual",
    Lists = "ofac_sdn,un,eu,uk"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new SanctionsScreeningQueryOptions {
    Name = "Banco Nacional de Cuba",
    Threshold = 0.85,
    Limit = 10,
    Type = "individual",
    Lists = "ofac_sdn,un,eu,uk"
};

using (var apiClient = new SanctionsScreeningAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "query": "Banco Nacional de Cuba",
    "matched": true,
    "matchCount": 1,
    "verdict": "exact",
    "topScore": 1,
    "results": [
      {
        "uid": 306,
        "name": "BANCO NACIONAL DE CUBA",
        "type": "entity",
        "score": 1,
        "confidence": "exact",
        "matchedOn": "BANCO NACIONAL DE CUBA",
        "matchedVia": "primary",
        "isWeakAlias": false,
        "programs": [
          "CUBA"
        ],
        "title": null,
        "aka": [
          {
            "name": "BNC",
            "type": "aka",
            "strength": "weak"
          },
          {
            "name": "NATIONAL BANK OF CUBA",
            "type": "aka",
            "strength": "strong"
          }
        ],
        "dateOfBirth": [],
        "placeOfBirth": [],
        "nationalities": [],
        "citizenships": [],
        "addresses": [
          {
            "address1": "Zweierstrasse 35",
            "city": "Zurich",
            "postalCode": "CH-8022",
            "country": "Switzerland"
          },
          {
            "address1": "Avenida de Concha Espina 8",
            "city": "Madrid",
            "postalCode": "E-28036",
            "country": "Spain"
          },
          {
            "address1": "Dai-Ichi Bldg. 6th Floor, 10-2 Nihombashi, 2-chome, Chuo-ku",
            "city": "Tokyo",
            "postalCode": "103",
            "country": "Japan"
          },
          {
            "address1": "Federico Boyd Avenue & 51 Street",
            "city": "Panama City",
            "country": "Panama"
          }
        ],
        "ids": [],
        "remarks": null,
        "source": "ofac_sdn",
        "sourceId": "306",
        "listedOn": null
      }
    ],
    "matchedLists": [
      "ofac_sdn"
    ],
    "list": {
      "source": "OFAC SDN",
      "authority": "US Department of the Treasury, Office of Foreign Assets Control",
      "publishDate": "10/21/2026",
      "recordCount": 19471,
      "lastUpdated": "2026-10-22T10:00:41.118Z"
    },
    "lists": [
      {
        "code": "ofac_sdn",
        "source": "OFAC SDN",
        "authority": "US Department of the Treasury, Office of Foreign Assets Control",
        "publishDate": "10/21/2026",
        "recordCount": 19471,
        "lastUpdated": "2026-10-22T10:00:41.118Z"
      },
      {
        "code": "ofac_cons",
        "source": "OFAC Consolidated (non-SDN)",
        "authority": "US Department of the Treasury, Office of Foreign Assets Control",
        "publishDate": "10/19/2026",
        "recordCount": 486,
        "lastUpdated": "2026-10-22T10:01:02.540Z"
      },
      {
        "code": "un",
        "source": "UN Security Council Consolidated List",
        "authority": "United Nations Security Council",
        "publishDate": "2026-10-21",
        "recordCount": 1010,
        "lastUpdated": "2026-10-22T10:01:09.876Z"
      },
      {
        "code": "eu",
        "source": "EU Consolidated Financial Sanctions List",
        "authority": "European Union (European Commission, Financial Sanctions Files)",
        "publishDate": "2026-10-15",
        "recordCount": 6234,
        "lastUpdated": "2026-10-22T10:01:31.204Z"
      },
      {
        "code": "uk",
        "source": "UK Sanctions List",
        "authority": "UK Foreign, Commonwealth & Development Office",
        "publishDate": "2026-10-16",
        "recordCount": 6408,
        "lastUpdated": "2026-10-22T10:01:52.663Z"
      }
    ]
  }
}
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
