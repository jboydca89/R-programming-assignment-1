complete <- function(directory, id = 1:332) {
        CompleteTab <- data.frame(id = numeric(0), nobs = numeric(0))
        for(num in id) {
                zeros <- ""
                if (num < 100) {
                        zeros <- "0"
                }
                if (num < 10) {
                        zeros <- "00"
                }
                TempDF <- read.csv(paste(c(directory, "/", zeros, num, ".csv"),
                                         sep = "", collapse = ""))
                cases <- sum(complete.cases(TempDF))
                CompleteTab <- rbind(CompleteTab,c(num,cases),
                                     deparse.level = 0)
        }
        colnames(CompleteTab) <- c("id","nobs")
        CompleteTab
}

complete(DirMap,3)
