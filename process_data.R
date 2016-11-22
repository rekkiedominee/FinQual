# get closing prices

all.close.data <- NULL
print("Splitting data...")
for(symbol in ticker.symbols)
{
# yearly
#close.data.yearly  <- to.yearly(get(symbol,stock.data))

# monthly
#close.data.monthly <- to.monthly(get(symbol,stock.data))

# weekly
#close.data.weekly  <- to.weekly(get(symbol,stock.data))

# daily
#close.data.daily  <- to.daily(get(symbol,stock.data))

close.data.daily <- as.matrix(last(get(symbol,stock.data),'5 years'))
close.data.daily <- cbind(rownames(close.data.daily),close.data.daily)
symbol.column    <- rep(symbol,length(close.data.daily[,1]))
close.data.daily <- cbind(data.frame(close.data.daily),symbol.column)
colnames(close.data.daily) <- c("Date","Open","High","Low","Close","Volume","Adjusted_Close","Symbol")
all.close.data   <- rbind(all.close.data,close.data.daily)

}

all.close.data.mod           <- data.frame(as.Date(all.close.data[,1]),as.numeric(as.character(all.close.data[,4])),as.character(all.close.data[,8]))
colnames(all.close.data.mod) <- c("Date","Close","Symbol")
ggplot(all.close.data.mod,aes(Date,Close)) + geom_line(data=all.close.data.mod,aes(Date,Close,color=Symbol))+ylab("Closing Price")
ggsave(paste("Output/Closing_Price_As_AT_",Sys.Date(),".pdf",sep=""), width = 6, height = 4)