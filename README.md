# Crypto Journal Mobile

[![Flutter](https://img.shields.io/badge/Flutter-3D9CEF?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/) [![Graphql](https://img.shields.io/badge/Graphql-E00797?style=for-the-badge&logo=graphql&logoColor=white)](https://graphql.org/) [![Firebase](https://img.shields.io/badge/Firebase-F9CA2A?style=for-the-badge&logo=firebase&logoColor=white)](https://firebase.google.com/)

Crypto Journal is the app for crypto investors that want to keep track of their operations in a simple and accessible way.

## Tech Stack

Crypto journal is powered by [Flutter](https://flutter.dev/), uses [Riverpod](https://riverpod.dev/) as state manager and relies on [Firebase](https://firebase.google.com/) to handle user sign in. Backend communication is handled by [Graphql](https://graphql.org/).

## Architecture

This project implements a variation of the clean architecture proposed by Uncle Bob (Robert C. Martin), explained [here](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) and by the excellent course made by [Reso Coder](https://github.com/ResoCoder) and avaliable on [youtube](https://www.youtube.com/playlist?list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech)

<img
alt="Clean Architecture Diagram"
src="https://blog.cleancoder.com/uncle-bob/images/2012-08-13-the-clean-architecture/CleanArchitecture.jpg" height="400">

## Features

### Login

The app allows its users to sign-in/sign-up with either `Facebook` or `Google`.

<img
alt="Login Screen"
src="./.github/readme/login.jpg" height="500">

### Overview

The home screen shows a general overview of the coins held by a user and its current value in [fiat money](https://en.wikipedia.org/wiki/Fiat_money)

<img
alt="Overview Screen"
src="./.github/readme/overview.jpg" height="500">

<!-- ![alt text](./.github/readme/overview.jpg) -->

### Transaction History

Allows a user to track his operations sorted by date. This screen has pagination support.

<img
alt="Transaction History Screen"
src="./.github/readme/transaction_history.jpg" height="500">

### Create a Transaction

A user can create transactions to keep track of his operations and keep his holding information updated.

<img
alt="Create Transaction Screen 1"
src="./.github/readme/create_transaction_1.jpg" height="500">

<img
alt="Create Transaction Screen 2"
src="./.github/readme/create_transaction_2.jpg" height="500">

<img
alt="Create Transaction Screen 2"
src="./.github/readme/create_transaction_3.jpg" height="500">

### Transaction Delete

A user can delete a transaction by swiping on one of the tabs and needs to confirm if he really wants to delete the item.

<img
alt="Delete Transaction Screen 1"
src="./.github/readme/transaction_delete_1.jpg" height="500">

<img
alt="Delete Transaction Screen 2"
src="./.github/readme/transaction_delete_2.jpg" height="500">

### User Data

A simple screen that shows which user is currently logged in and allows to sign-out.

<img
alt="Settings Screen"
src="./.github/readme/settings.jpg" height="500">

## License

[MIT](./LICENSE)
