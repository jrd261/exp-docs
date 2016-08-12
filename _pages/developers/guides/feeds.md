---
permalink: /developers/guides/feeds/
title: Feeds
keywords: developer
last_updated: July 11, 2016
tags: []
---

<link rel="stylesheet" href="/_pages/developers/guides/feeds.css">

# Overview

To include data from third party data sources such as Facebook pages or local weather reports, EXP has the concept of feeds.
The data from a feed will be available to your app in a simple, unified JSON format, so that an app can easily handle different data sources
without being modified. 

The feeds can be acessed through a method on your EXP SDK, so consult the reference for your platform below. This guide will have more detail
about how to use feeds and how they can be configured.

- [JavaScript SDK - Reference](http://docs.goexp.io/developers/reference/javascript-sdk-1.0.0/)

- [Python SDK - Reference](http://docs.goexp.io/developers/reference/python-sdk/)

- [Player app SDK - Reference](http://docs.goexp.io/developers/reference/player-app-sdk/)

- [IOS SDK - Reference](http://docs.goexp.io/developers/reference/ios-sdk/)

- [Android SDK - Reference](http://docs.goexp.io/developers/reference/android-sdk/)

# Integrations
Most of the feed types in EXP require permissions to access the third party data source. 
To permanently link credentials for data sources that you provide, EXP has the concept of integrations.
You can create a new integration from the integrations route (see below).
Here the required credentials can be entered and then the integration will be available to everyone in the organization.

![Data Source Integration](/common_images/developers/integrations.png "Data Source Integration")

## Adding an Integration
- Find the integration source that your app will use and press the ADD button. 

- A redirect will happen to the login permission page of the third party online data source provider.

- Enter credentials and accept. 

- The EXP integrations page will appear again. 

If the integration fails, an error message will appear:
 
![Data Source Integration Error Message](/common_images/developers/integration_error.png "Data Source Integration Error")

When the integration is successfuly added it will show up under configured integrations.

![Data Source Integration](/common_images/developers/integrations_implemented.png "Data Source Integration Implemented")

## Updating an Integration
If for any reason the integration needs to be updated, for example a permission setting that has changed, click the integration's Update button to make changes.

## Removing an Integration
When removing an integration the EXP platform will attempt to revoke access it received from the third party provider. 
Some third party providers do not allow this revoke access to happen automatically, in this case you will be shown a warning and given a link to manually remove it.
     
# Feeds

  
<table class="feed-information">
  <thead>
    <tr>
      <th>Feed Type</th>
      <th>Integration</th>
      <th>Subtype</th>
      <th>Dynamic Feed</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="category" colspan="4">Social Media</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/facebook.svg">
        Facebook
      </td>
      <td>Facebook</td>
      <td>scala:feed:facebook</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/instagram.svg">
        Instagram
      </td>
      <td>Instagram</td>
      <td>scala:feed:instagram</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/twitter.svg">
        Instagram
        Twitter
      </td>
      <td>Twitter</td>
      <td>scala:feed:twitter</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/linkedIn.svg">
        LinkedIn
      </td>
      <td>LinkedIn</td>
      <td>scala:feed:linkedIn</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td class="category" colspan="4">Spreadsheet</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/google-drive.svg">
        Google Spreadsheet
      </td>
      <td>Google Drive</td>
      <td>scala:feed:googleSpreadsheet</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/one-drive.svg">
        Microsoft Spreadsheet
      </td>
      <td>Microsoft OneDrive</td>
      <td>scala:feed:microsoftSpreadsheet</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td class="category" colspan="4">Calendar</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/google-calendar.svg">
        Google Calendar
      </td>
      <td>Google Calendar</td>
      <td>scala:feed:google</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/outlook.svg">
        Microsoft Calendar
      </td>
      <td>Microsoft Calendar</td>
      <td>scala:feed:outlook</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td class="category" colspan="4">POS</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/shopify-logo.svg">
        Shopify
      </td>
      <td>Shopify</td>
      <td>scala:feed:shopify</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/square-logo.svg">
        Square
      </td>
      <td>Square</td>
      <td>scala:feed:square</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td class="category" colspan="4">Git</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/github.svg">
        GitHub
      </td>
      <td>GitHub</td>
      <td>scala:feed:gitHub</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/bitbucket.svg">
        BitBucket
      </td>
      <td>BitBucket</td>
      <td>scala:feed:bitBucket</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td class="category" colspan="4">Other</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/weather-partlycloudy.svg">
        Weather
      </td>
      <td>N/A</td>
      <td>scala:feed:weather</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/rss-box.svg">
        RSS
      </td>
      <td>N/A</td>
      <td>scala:feed:rss</td>
      <td>No</td>
    </tr>
    <tr>
      <td>
        <img src="/common_images/feedIcons/access-point.svg">
        RSS
        Generic Endpoint
      </td>
      <td>N/A</td>
      <td>scala:feed:generic</td>
      <td>No</td>
    </tr>
  </tbody>
</table>

Feeds can be created from the feeds section and you will see a list of existing feeds:

![Feed List](/common_images/developers/feed.png "Feed")

## Adding a feed
- Click the Add icon <img src="/common_images/plus.svg" class="icon"> in the right top corner.
- A dialog appears. Choose a valid, unique name and select the type of feed. A list of integrations will appear if required.
Depending on what type of feed is selected, multiple options can be entered such as "search" or "max items". The details of these fields are documented later in this guide.
- When done press the Save button.

![New Feed](/common_images/developers/feed_new.png "New Feed")
 
## Previewing feed data
Once you've created a feed, you can see what the data it is returning looks like.
 
- Select the feed in the list by checking the checkbox. 
- Click the preview icon <img src="/common_images/eye.svg" class="icon"> in the top right corner.
- A dialog opens to show the preview data in JSON format. 
- The data can be downloaded by pressing the Download button in the bottom right corner.

![Feed Preview](/common_images/developers/feed_data.png "Feed Preview Data")

## Remove Feed
- Make sure there are no apps currently running that rely on this feed.
- Select the feed in the list by checking the checkbox.
- Click the Delete icon <img src="/common_images/delete.svg" class="icon"> in the top right corner.

## Feed Configuration Fields

### General fields
- **Feed Name** (required): a name that is only useful to you to remember what this feed is for and identify it in a list of other feeds. e.g. *New York City weather*

### Facebook
- **Profile/Page** (required): the page or profile name to pull data from. You must have access to the page or profile with the credentials in your Facebook integration.

- **Max Number of Results** (required): the amount of posts that the feed should return.

### Twitter
- **Profile/Page** (optional): the page or profile name to pull data from.

  *or*

  **Query** (optional): a query string to filter data from Twitter. More information about queries can be found [here](https://dev.twitter.com/rest/public/search).

- **Max Number of Results** (required): the amount of posts that the feed should return.

### Instagram
- **Profile/Page** (optional): the page or profile name to pull data from.

  *or*

  **Query** (optional): a tag name to search for.  

- **Max Number of Results** (required): the amount of posts that the feed should return.

### Facebook
- **Company Name/ID** (required): the page or profile name to pull data from. You must have access to the page or profile with the credentials in your Facebook integration.

- **Max Number of Results** (required): the amount of posts that the feed should return.

### Google Calendar
- **Calendar ID** (required): the calendarID to get the events from. You must have access to this calendar with the credentials in your Google Calendar integration.
 
- **Number of Days** (required): the number of days to look for events from the current date forwards.

### Microsoft Calendar
- **Calendar Name** (required): the calendar name to get the events from. You must have access to this calendar with the credentials in your Microsoft Calendar integration.
 
- **Number of Days** (required): the number of days to look for events from the current date forwards.

### Google Spreadsheet
- **Spreadsheet ID/File Path** (required): the ID or path to the spreadsheet file. As path backslash and forward slash can be used. e.g. *//documents//test* or *\\documents\\test* or */documents/test* or *\documents\test*.

- **Sheet Name** (optional): the sheet name you want to access the data from. If not defined first sheet name is automatically selected.

- **First Row As Header** (optional): when selecting this option the first row of the spreadsheet is used as header names. If there are headers that have the same name in the JSON result, an array of values for this header will be returned.

- **Max Number of Results** (required): the number of rows that the feed should return.

### Microsoft Spreadsheet
- **Spreadsheet ID/File Path** (required): the ID or path to the spreadsheet file. As path backslash and forward slash can be used. e.g. *//documents//test* or *\\documents\\test* or */documents/test* or *\documents\test*

- **Sheet Name** (optional): the sheet name you want to access the data from. If not defined first sheet name is automatically selected.

- **First Row As Header** (optional): when selecting this option the first row of the spreadsheet is used as header names. If there are headers that have the same name in the JSON result, an array of values for this header will be returned.

- **Max Number of Results** (required): the number of rows that the feed should return.

### Weather
- **City, Zip, or Place** (required): the location information to search for weather results. A combination of city and country can be used. e.g. *Amsterdam, Netherlands*, *New York, United States* . 

- **Language Code** (optional): the language code to translate the weather content. The following languages are supported:
 
  **AF	Afrikaans |
  AL	Albanian |
  AR	Arabic |
  HY	Armenian |
  AZ	Azerbaijani |
  EU	Basque |
  BY	Belarusian |
  BU	Bulgarian |
  LI	British English |
  MY	Burmese |
  CA	Catalan |
  CN	Chinese - Simplified |
  TW	Chinese - Traditional |
  CR	Croatian |
  CZ	Czech |
  DK	Danish |
  DV	Dhivehi |
  NL	Dutch |
  EN	English |
  EO	Esperanto |
  ET	Estonian |
  FA	Farsi |
  FI	Finnish |
  FR	French |
  FC	French Canadian |
  GZ	Galician |
  DL	German |
  KA	Georgian |
  GR	Greek |
  GU	Gujarati |
  HT	Haitian Creole |
  IL	Hebrew |
  HI	Hindi |
  HU	Hungarian |
  IS	Icelandic |
  IO	Ido |
  ID	Indonesian |
  IR	Irish Gaelic |
  IT	Italian |
  JP	Japanese |
  JW	Javanese |
  KM	Khmer |
  KR	Korean |
  KU	Kurdish |
  LA	Latin |
  LV	Latvian |
  LT	Lithuanian |
  ND	Low German |
  MK	Macedonian |
  MT	Maltese |
  GM	Mandinka |
  MI	Maori |
  MR	Marathi |
  MN	Mongolian |
  NO	Norwegian |
  OC	Occitan |
  PS	Pashto |
  GN	Plautdietsch |
  PL	Polish |
  BR	Portuguese |
  PA	Punjabi |
  RO	Romanian |
  RU	Russian |
  SR	Serbian |
  SK	Slovak |
  SL	Slovenian |
  SP	Spanish |
  SI	Swahili |
  SW	Swedish |
  CH	Swiss |
  TL	Tagalog |
  TT	Tatarish |
  TH	Thai |
  TR	Turkish |
  TK	Turkmen |
  UA	Ukrainian |
  UZ	Uzbek |
  VU	Vietnamese |
  CY	Welsh |
  SN	Wolof |
  JI	Yiddish - transliterated |
  YI	Yiddish - unicode** 

### RSS
- **RSS feed URL** (required): a valid rss url.  

- **Max Number of Results** (required): the number of rows that the feed should return.

### Generic Endpoint
- **API endpoint** (required): a valid rest api url.

- **Headers** (optional): headers required by the api call.

### Square
- **Item Types** (required): select to pull orders or products from the POS provider.

- **Max Number of Results** (required): the number of items that the feed should return.

### Shopify
- **Item Types** (required): select to pull orders or products from the POS provider. When selected there are multiple filter fields to narrow down the search, example only orders that are closed.

- **Max Number of Results** (required): the number of items that the feed should return.

### GitHub
- **Username / Organization name** (required): a valid username or organization name.

- **Repository** (required): a valid repository.

- **Max Number of Results** (required): the number of pull requests that the feed should return.

### BitBucket
- **Username / Organization name** (required): enter a valid username or organization name.

- **Repository** (required): a valid repository.

- **Max Number of Results** (required): the number of pull requests that the feed should return.

## Feed Json Structure
The structure of the JSON returned by a feed is standardized as much as possible. 

At the top of the JSON structure is `search` with details about the query or search terms that generated this feed.

Then there is `details` with information including `profile`, `page`, `shop` or `account` depending on the type of feed.

Finally, the actual data of the feed is in `items`. Fields that can differ per feed are located in `metadata`. `raw` contains the original information.  
   
```json
{
  "search": { ... info about the search ... },
  "details": { ... profile, page, shop, or account info ... },
  "items":[
    "date": "",
    "text": "",
    "shares": 0,
    "likes": 0,
    "comments": 0,
    "images": [ { "url": "" } ],
    "videos": [ { "url": "" } ],
    "links": [ { "url": "" } ],
    "metadata": {
      "startDate": "",
      "endDate": "",
      "high": { "c": 0, "f": 0 },
      "low": { "c": 0, "f": 0 },
      "current": { "c": 0, "f": 0 },
      "amount": 0
    }
    "tags":[], // array of strings
    "createdBy": "",
    "createdByDisplay": "",
    "type": "",
    "raw": { ... original data from search ...}
  ]
}
```

## Dynamic Feeds
In some cases it could be that numerous feeds are required by a single app. For example, showing weather data for many different locations would normally require a feed for each location.
It would take a lot of time to manually create a feed for each location and add each of them to the app in turn.

For such a use case, feeds can be created with the dynamic option set to True. Then options that would normally be configured once on the feed can instead be sent as parameters alongside the feed UUID when requesting it from EXP. In other words, instead of your app consuming the feed "as is", it will have the ability to use the feed with whatever parameters it wants, and it can change those on the fly. An app using a Weather feed set to dynamic could use the same feed to request weather data from multiple different areas.

### Creating a Dynamic Feed
- Create a feed as you would normally
- Check the Dynamic option. All other fields will be removed.

![Dynamic Feed](/common_images/developers/feed_dynamic.png "Feed Dynamic")

### Previewing a Dynamic Feed 
Once you've created a dynamic feed, you can see what it's like to have dynamic parameters and what it returns.
 
- Select the feed in the list by checking the checkbox. 
- Click the preview icon <img src="/common_images/eye.svg" class="icon"> in the top right corner.
- A dialog opens to show the preview data in JSON format. At the top of the dialog you can see the fields that are sent as parameters to EXP.
- Enter all fields required and press Preview to see the data returned. 
  
![Feed Dynamic Preview](/common_images/developers/feed_dynamic_preview.png "Feed Dynamic Preview")

### Exceptions
There are a couple of feed types not available as dynamic. Currently they are RSS and Generic Endpoint.  
