<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/>
		<br />
		<a href="https://aws.amazon.com"><img src="https://img.shields.io/badge/-deployed-blank.svg?style=social&logo=amazon"></a>
		<br />
	</p>
  <h3>lab-platform-hosted-zones</h3>
	</a> <a href="https://app.circleci.com/pipelines/github/ThoughtWorks-DPS/lab-platform-hosted-zones"><img src="https://circleci.com/gh/ThoughtWorks-DPS/lab-platform-hosted-zones.svg?style=shield"></a>
	<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/github/license/ThoughtWorks-DPS/lab-platform-hosted-zones"></a>
</div>
<br />

Manage multiaccount subdomain hosted zones and zone delegations.  

## lab managed domains (account where top level domain resides)

* twdps.io (dps-1)  
* twdps.digital (dps-2)  

Creates the following hosted zones in the specified account:  
| hosted zone                     | dps-1 | dps-2 |
|---------------------------------|:-----:|:-----:|
| sandbox-us-east-2.twdps.digital |       |   •   |
| sandbox-us-east-2.twdps.io      |       |   •   |
| prod-us-east-1.twdps.digital    |   •   |       |
| prod-us-east-1.twdps.io         |   •   |       |
| dev.twdps.digital               |   •   |       |
| dev.twdps.io                    |   •   |       |
| qa.twdps.digital                |   •   |       |
| qa.twdps.io                     |   •   |       |
| preview.twdps.digital           |       |   •   |
| preview.twdps.io                |       |   •   |
| prod.twdps.digital              |   •   |       |
| prod.twdps.io                   |   •   |       |

### single declarative state

This is a single declarative state configuration maintenance pipeline. Multiple aws account providers are configured in the same plan to reconcile the dependent state between aws accounts and delegation zones. The top level domains are assumed to already exist.  

Note: this patterns applies for domains owned by the platform. Supporting customers who need to use their own domains is implemented through an operator and are therefore, in effect, are self-managed by the customer. 
