corr <- function(directory, threshold = 0) {
        CorrVec <- vector(mode = "numeric")
        FileNames <- list.files(directory, pattern = ".csv")
        for(name in FileNames) {
                TempDF <- read.csv(paste(c(directory,"/",name), sep = "", collapse = ""))
                if(sum(complete.cases(TempDF)) > threshold) {
                        TempDF <- TempDF[complete.cases(TempDF),]
                        CorrVec <- append(CorrVec, cor(TempDF$sulfate,TempDF$nitrate))
                }
        }
        CorrVec
}