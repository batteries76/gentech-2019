require_relative 'csv_parser'

widget = Parsers::CSVParser.new('./data.csv')
print widget.parsed_data