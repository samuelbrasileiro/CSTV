# MatchTracker

The MatchTracker module provides functionalities to track matches and player details across different leagues and tournaments.

# Features

## Matches

#### Description
The Matches feature allows users to track ongoing and upcoming matches in various leagues and tournaments.

#### Requirements

- Users can view upcoming matches and current matches.
- Current matches are on top of the list.
- Navigation title is large.
- Users should be able to view matches teams images, names and start dates.
- Users can access to more details of a match.
- Users can refresh.
- The API access to more upcoming is by pagination.
- The view have responsiveness to all iOS 15 devices.
- Circular on-center progress view must be displayed when first loading the screen.

#### Route
- `matches`

#### Providers
- `RunningMatchesProvider`: Provides access to data for ongoing matches.
- `UpcomingMatchesProvider`: Provides access to data for upcoming matches.

### Match Details

#### Description
The Match Details feature allows users to explore more information about the match, its teams and various players participating in it. Users can view players, including their team, image, and full name.

#### Requirements
- Navigation title is sized default.
- Users should be able to view the match teams images, names and start dates.
- The players of the same team of the match must be displayed at the same side of the screen.
- Users can refresh.
- The view have responsiveness to all iOS 15 devices.
- Users can navigate back.
- Circular on-center progress view must be displayed when first loading the screen.

#### Route
- `matchDetails(match: Match)`

#### Providers
- `PlayersProvider`: Provides access to players data based on team ID.

---

# Data Types

### Match

Structure representing a match.

#### Attributes

| Attribute | Description |
|---|---|
| `beginAt` | The start date of the match. |
| `endAt` | The end date of the match. |
| `id` | The match ID. |
| `league` | Information about the league of the match. |
| `name` | The name of the match. |
| `opponents` | List of opponents in the match. |
| `serie` | Information about the series of the match. |
| `tournament` | Information about the tournament of the match. |

#### Methods

- `getTitle()`: Returns a string containing the league name and the series name of the match.

### League

Structure representing a league.

#### Attributes

| Attribute | Description |
|---|---|
| `id` | The league ID. |
| `imageURL` | The URL of the league's image. |
| `name` | The name of the league. |
| `url` | The URL of the league. |

### Series

Structure representing a series of matches.

#### Attributes

| Attribute | Description |
|---|---|
| `beginAt` | The start date of the series. |
| `endAt` | The end date of the series. |
| `fullName` | The full name of the series. |
| `id` | The series ID. |
| `name` | The name of the series. |

### Tournament

Structure representing a tournament.

#### Attributes

| Attribute | Description |
|---|---|
| `beginAt` | The start date of the tournament. |
| `endAt` | The end date of the tournament. |
| `id` | The tournament ID. |
| `name` | The name of the tournament. |

### Player

Structure representing a player.

#### Attributes

| Attribute | Description |
|---|---|
| `currentTeam` | Information about the player's current team. |
| `firstName` | The first name of the player. |
| `lastName` | The last name of the player. |
| `id` | The player ID. |
| `imageURL` | The URL of the player's image. |
| `name` | The nickname of the player. |

#### Methods

- `getFullName()`: Returns a string containing the full name of the player.

### Team

Structure representing a team.

#### Attributes

| Attribute | Description |
|---|---|
| `acronym` | The team's acronym. |
| `location` | The location of the team. |
| `id` | The team ID. |
| `imageURL` | The URL of the team's image. |
| `name` | The name of the team. |

### MatchTrackerColor

Enumeration representing colors for use in MatchTracker.

Cases:

| Case |Color |
|---|---|
| `online` | ![Online Color](https://via.placeholder.com/40/F42A35) |
| `offline` | ![Offline Color](https://via.placeholder.com/40/FAFAFA33) |

---

# Data Providers

### PlayersProvider

A class for providing functionality to retrieve the players' data.

#### Methods

- `execute(teamId: Int) async throws -> PlayersResponse`: Returns a list of players for the given team ID.

### RunningMatchesProvider

A class for providing functionality to retrieve running on-time matches.

#### Methods

- `execute() async throws -> MatchesResponse`: Returns a list of running matches.

### UpcomingMatchesProvider

A class for providing functionality to retrieve upcoming matches.

#### Methods

- `execute(page: Int) async throws -> MatchesResponse`: Returns a list of upcoming matches with pagination support.

---

# Service

### MatchTrackerRequest

Class defining requests for MatchTracker.

#### Cases

| Cases | Description |
|---|---|
| `players(teamId: String)` | A request for retrieving the players of a team. |
| `runningMatches` | A request for retrieving current running matches. |
| `upcomingMatches` | A request for retrieving upcoming matches. |

### MatchTrackerService

Class implementing methods for accessing MatchTracker data.

Methods:

- `getPlayers(teamId: Int, completion: @escaping (Result<PlayersResponse, Error>) -> Void)`: Retrieves players for the given team ID.
- `getUpcomingMatches(page: Int, completion: @escaping (Result<MatchesResponse, Error>) -> Void)`: Retrieves upcoming matches with pagination support.
- `getRunningMatches(completion: @escaping (Result<MatchesResponse, Error>) -> Void)`: Retrieves running matches.

---

## Match Views

### MatchItemView

View for displaying a match item.

#### Attributes

- `match`: The match to be displayed.

### MatchTeamsView

View for displaying teams in a match.

#### Attributes

- `match`: The match to be displayed.

### TeamView

View for displaying a team.

#### Attributes

- `team`: The team to be displayed.

### PlayerView

View for displaying a player.

#### Attributes

- `player`: The player to be displayed.
- `isLeftAligned`: Flag indicating the alignment of the view.

### TeamPlayersView

View for displaying a list of team players.

#### Attributes

- `players`: The list of players to be displayed.
- `isLeftAligned`: Flag indicating the alignment of the view.

### MatchDetailsView

View for displaying match details.

#### Attributes

- `viewModel`: The view model for the view.

### MatchesView

Main View, for upcoming and current matches.

#### Attributes

- `viewModel`: The view model for the view.
