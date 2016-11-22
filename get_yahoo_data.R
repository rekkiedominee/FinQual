stock.data <- new.env()

# Load all ticker data
print("Loading ticker data...")
for(symbol in ticker.symbols)
{
  print(symbol)
  getSymbols(symbol,env = stock.data)
}
