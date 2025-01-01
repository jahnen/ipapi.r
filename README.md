![스크린샷 2025-01-02 오전 12 28 23](https://github.com/user-attachments/assets/331379e7-a1ee-4871-b390-7cc8e83e489d)

# ipapi.r

{ipapi.r} is an R package designed to retrieve and analyze information about IP addresses with [IPQuery API](https://ipquery.io/). 

It provides tools to query IP-related metadata, such as geolocation, ISP details, and more, making it ideal for developers and data scientists working with IP-based insights.

## ✨ Features 
- Retrieve geolocation details for any IP address.
- Identify ISP and organization information.
- Support for querying single or multiple IP addresses.
- Easy integration with public IP lookup APIs.
- Compatible with {httr2} for modern and secure HTTP requests.

## 🔧 Installation

### From GitHub
To install the development version from GitHub:

```r
# install.packages("pak")
pak::pak("jahnen/ipapi.r")
```

> CRAN, R-universe will be available soon.

## 💕 Usage
Querying an IP Address
Retrieve metadata for a single IP address:

```r
library(ipapi.r)
# Getting Your Own IP
IPQuery()

# Query Own IP
IPQuery("self") 

# Query details for a specific IP
IPQuery("1.1.1.1")
# Querying Multiple IPs
IPQuery(c("1.1.1.1", "2.2.2.2"))
```

## 🤝 Contributing
Contributions are welcome! To contribute:

1. Fork this repository.
2. Create a feature branch (git checkout -b feature/your-feature-name).
3. Commit your changes (git commit -am 'Add a new feature').
4. Push to the branch (git push origin feature/your-feature-name).
5. Create a pull request.
Please ensure all changes are tested and documented before submitting.

## ❗ Issues and Support
If you encounter any issues, please report them on the GitHub Issues page.

## 📝 License
This package is licensed under the MIT License. See the LICENSE file for details.

## 📚 Acknowledgments

<img src='https://github.com/user-attachments/assets/0fb35316-28fc-4eb2-bf08-309bcc10460e' width = '100px'>

This package was inspired by [IPQuery project](https://github.com/ipqwery).

