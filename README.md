# Country Info App

A simple Swift app for representing country data, including details such as name, capital, region, and country code. This is prepared as part of a coding assignment, showcasing both UIKit and SwiftUI implementations for displaying table data and navigation.

## Assignment

Use the following technologies:
[x] Design pattern -- MVVM
[x] Unit testing
[x] Combine
[x] SwiftUI
Follow the instructions mentioned in the attached document
1. Fetch a list of countries in JSON format from this URL: https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json
2. Display all the countries in a UITableView ordered by the position they appear in the JSON. In each table cell, show the country's "name", "region", "code" and "capital" in this format:

```   ---------------------------------------   |                                     |   | "name", "region"             "code" |   |                                     |   | "capital"                           |   |                                     |   --------------------------------------- ```

The user should be able to scroll thru the entire list of countries. 3. Use a UISearchController to enable filtering by "name" or "capital" as the user types each character of their search. The implementation should be robust (i.e., handle errors and edge cases), support Dynamic Type, support iPhone and iPad, and support device rotation.
 4. Please use UIKit, not SwiftUI, for this exercise.

## Approach

Since the email mentions to use SwiftUI but the Word doc mentions to use UIKit, I created two different interfaces to satisfy both.
UIKit requires significantly more lines of code to create the same view that SwiftUI can do in a few lines. 
Because of the complexity and time limit, I added the search functionality only to the SwiftUI version.

## Features

- Fetches and displays a list of countries from a remote source.
- Two fully-featured versions: one using UIKit (CountryTableViewController), one using SwiftUI (CountryListView).
- Tappable navigation from an intro screen to select either framework.
- Displays country name, region, code, and capital in each row.
- Search/filter countries in the SwiftUI version.
- MVVM data architecture with observable shared data (CountryData).

## Usage Example

1. On launch, select either “UIKit” or “SwiftUI” to view the country list.
2. Browse the countries. In SwiftUI view, use the search bar to filter.
3. Data is fetched automatically when the app starts.


## Screenshots

![IntroView](screenshots/intro.png)
![UIKit](screenshots/uikit.png)
![SwiftUI](screenshots/swiftui.png)
![Search](screenshots/search.png)

## Structure

### Model
- Country - Decodable simple struct that holds the country code, region, name, and capital properties, also has a convenience method for the search functionality

### ViewModel
- CountryData — Shared observable object holding country data, responsible for loading via networking

### SwiftUI Views 

- IntroView — Lets user pick between UIKit and SwiftUI versions
- CountryListView — SwiftUI list of countries with search

### UIKit View & ViewController
- CountryTableViewController — UIKit table view showing countries
- CountryTableViewCell — Custom cell with country info


## Credits

- Created by Deniz Sarac for a coding assignment.
