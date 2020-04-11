pollutantmean <- function(directory, pollutant, id = 1:332) {
        MasterTab <- data.frame()
        for(num in id) {
                zeros <- ""
                if (num < 100) {
                        zeros <- "0"
                }
                if (num < 10) {
                        zeros <- "00"
                }
                MasterTab <- rbind(MasterTab, read.csv(paste(c(directory, "/", zeros, num, ".csv"), sep = "", collapse = "")))
        }
        good <- complete.cases(MasterTab[pollutant])
        mean(MasterTab[pollutant][good,])
}