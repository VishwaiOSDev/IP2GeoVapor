![IP2GeoVapor](https://images.madrasvalley.com/ip2geovapor-india.png)

# IP2GeoVapor

[![Build Status](https://jenkins.prod.loadify.app/buildStatus/icon?job=IP2GeoVapor)](https://jenkins.prod.loadify.app/job/IP2GeoVapor/)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fswiftcsv%2FSwiftCSV%2Fbadge%3Ftype%3Dplatforms)]()

IP2Geo is a Vapor API that allows you to easily fetch geographical information of an IP address. The IP-API service uses HTTP by default, but this package uses HTTPS to ensure a secure connection.

# Usage

To get the geographical information of an IP address, you can make a GET request to `/json/:ipAddress` where **:ipAddress** is the IP address for which you want to get the information. The response will be in the form of `JSON`.

```json
{
  "status": true,
  "country": "United States",
  "countryCode": "US",
  "regionName": "California",
  "city": "Mountain View",
  "query": "8.8.8.8",
  "currency": "USD"
}
```

## Response

The response will be a JSON object containing the following information:

- `status`: Boolean, "true" if the request was successful, "false" otherwise.
- `currency`: String, the currency used in the country of the IP address.
- `country`: String, the name of the country of the IP address.
- `countryCode`: String, the 2-letter country code of the IP address.
- `regionName`: String, the name of the region of the IP address.
- `city`: String, the name of the city of the IP address.
- `query`: String, the IP address used in the request.

> **Note**\
> This endpoint is limited to 45 requests / minute

> **Warning**\
> If the IP address is not valid, the server will return a `400 Bad Request` response.

# Customization

## Response Format

The response format can be changed by specifying the `responseType` parameter in the `getIpApiResponse(_:for:responseType:)` function. The available options are `.json`, `.xml`, `.csv` and `.newline`.

## Work In Progress

- [ ] Adding support for csv, xml, newline
- [ ] Adding support for IPv6 addresses
- [ ] Adding option to specify the fields to be returned in the IP-API response

# Error Handling

In case of any error, the package throws Abort error with status `400 Bad Request`

## Author

<a href="https://github.com/VishwaiOSDev" title="VishwaiOSDev">
  <img src="https://avatars.githubusercontent.com/u/71421776?v=4" style="border-radius: 12%;" width="50;" alt="fw_qaq"/>
</a>

# License

IP2GeoVapor is released under the MIT license.
