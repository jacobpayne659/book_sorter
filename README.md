# BookSorter Application

## Overview

BookSorter is a Ruby application designed to organize book data efficiently. It can sort books by publication date, rating, and title, both in ascending and descending order. This application is built with simplicity in mind, providing clear outputs for sorted book data.

## Getting Started

To get started with the BookSorter application, clone this repository to your local machine or download the source code directly.

### Prerequisites

- Ruby (version 2.5 or newer)
- Bundler (for managing Ruby gems)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/jacobpayne659/book_sorter.git
   ```

2. Navigate to the application directory:
   ```
   cd book_sorter
   ```

3. Install the required gems:
   ```
   bundle install
   ```

## Running the Application

To run the BookSorter application, you can use the `main.rb` script. Execute the script from the command line by navigating to the project directory and running:

```
ruby app/main.rb
```
This will run the script using the input provided in the instructions.
You can also pass a specific CSV file as an argument to the script for additional testing:
```
ruby app/main.rb path/to/your/books.csv
```

## Running Tests
Tests are written using RSpec. To run the tests, you'll need to have RSpec installed. If you've already run bundle install, RSpec should be ready to use.

To execute the tests, run the following command from the root of the project:

```
bundle exec rspec
```
Or simply
```
rspec
```
This will run all the test suites and output the results to your terminal, showing you which tests have passed and which have failed.
