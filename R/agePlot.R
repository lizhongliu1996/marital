#' agePlot Helper function that draws a bar chart when passed a sex and marriage categories vector
#'
#' @param thePlace Vector that refers to a place
#' @param theGroup for marital status group which
#' @param theSex Females or Males
#'
#' @return NULL
#' @import ggplot2 acs
#' @import stringr XML
#'
#'
#' @export
#'
#' @examples
#' agePlot("Miami-Dade County", "Never married", theSex = "Male")
#' agePlot("Alachua County", "Divorced", theSex = "Female")
#'
#'
agePlot <- function(thePlace, theGroup, theSex) {
  # kluge to avoid note about use of internal dataset in build
  floridaCountyMarital <- NULL
  rm(floridaCountyMarital)
  utils::data(floridaCountyMarital, envir = environment())

  theNewPlace<-paste(thePlace,c("County, Florida"))
  place<-floridaCountyMarital[floridaCountyMarital@geography$NAME==theNewPlace]

  if (theSex=="Male") {
    if(theGroup=="Never married"){
      theRange<-4:17
      i<-3
    }else if(theGroup=="Married"){
      theRange<-20:33
      i<-4
    }else if(theGroup=="Married, spouse absent"){
      theRange<-36:49
      i<-5
    }else if(theGroup=="Married, other"){
      theRange<-51:64
      i<-5
    }else if(theGroup=="Widowed"){
      theRange<-66:79
      i<-3
    }else if(theGroup=="Divorced"){
      theRange<-81:94
      i<-3
    }
  }else if (theSex=="Female") {
    if(theGroup=="Never married"){
      theRange<-97:110
      i<-3
    }else if(theGroup=="Married"){
      theRange<-113:126
      i<-4
    }else if(theGroup=="Married, spouse absent"){
      theRange<-129:142
      i<-5
    }else if(theGroup=="Married, other"){
      theRange<-144:157
      i<-5
    }else if(theGroup=="Widowed"){
      theRange<-159:172
      i<-3
    }else if(theGroup=="Divorced"){
      theRange<-174:187
      i<-3
    }
  }

  hehe<-place@estimate[theRange]
  hehe<-as.data.frame(hehe)
  colons <- str_locate_all(place@acs.colnames[theRange], ":")[[1]]
  hehe$range<-str_sub(place@acs.colnames[theRange],colons[i]+2,-1)
  colnames(hehe)[1]<-c("estimate_num")

  colors<-c("#1B9E77","#D95F02","#7570B3","#E7298A","#66A61E","#E6AB02","#A6761D",
            "#666666","#A6CEE3","#1F78B4","#B2DF8A","#33A02C","#FB9A99","#E31A1C")

  titles<-paste(thePlace, theSex, theGroup,sep=" - ")

  ggplot(data=hehe, aes(y=estimate_num, x=range,fill=range)) +
    geom_bar(stat="identity")+
    scale_fill_manual(values = colors) +
    coord_flip()+
    labs(title = titles, subtitle = "2016 American Community Survey 5-Year Estimates") +
    guides(fill=FALSE)

}

