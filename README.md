# Crypto Journal Mobile

<p align="center">
<img alt="flutter badge" src="https://img.shields.io/badge/Flutter-3D9CEF?style=for-the-badge&logo=flutter&logoColor=white&link=https://flutter.dev/">

<img alt="graphql badge" src="https://img.shields.io/badge/Graphql-E00797?style=for-the-badge&logo=graphql&logoColor=white&link=https://graphql.org/">

<img alt="firebase badge" src="https://img.shields.io/badge/Firebase-F9CA2A?style=for-the-badge&logo=firebase&logoColor=white&link=https://firebase.google.com/">
</p>

Crypto Journal is the app for crypto investors that want to keep track of their operations in a simple and accessible way.

## Tech Stack

Crypto journal is powered by [Flutter](https://flutter.dev/), uses [Riverpod](https://riverpod.dev/) as state manager and relies on [Firebase](https://firebase.google.com/) to handle user sign in. Backend communication is handled by [Graphql](https://graphql.org/).

## Features

### Login

The app allows its users to sign-in/sign-up with either `Facebook` or `Google`.

![alt text](./.github/readme/login.jpg)

### Overview

The home screen shows a general overview of the coins held by a user and its current value in [fiat money](https://en.wikipedia.org/wiki/Fiat_money)

![alt text](./.github/readme/overview.jpg)

### Transaction History

Allows a user to track his operations sorted by date. This screen has pagination support.

![alt text](./.github/readme/transaction_history.jpg)

### Create a Transaction

A user can create transactions to keep track of his operations and keep his holding information updated.

![alt text](./.github/readme/create_transaction_1.jpg)

![alt text](./.github/readme/create_transaction_2.jpg)

![alt text](./.github/readme/create_transaction_3.jpg)

### Transaction Delete

A user can delete a transaction by swiping on one of the tabs and needs to confirm if he really wants to delete the item.

![alt text](./.github/readme/transaction_delete_1.jpg)

![alt text](./.github/readme/transaction_delete_2.jpg)

### User Data

A simple screen that shows which user is currently logged in and allows to sign-out.

![alt text](./.github/readme/settings.jpg)

## License

[MIT](./LICENSE)
