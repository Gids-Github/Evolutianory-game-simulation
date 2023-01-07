#Variables and const
r1=0
epo=1
epoches=1
#Strategy dataframe creation
full_row0 = rep("C", 99)
dataframe_row<- data.frame(full_row0)

for(i in 1:98) {                                   # Head of for-loop
  full_row <- rep("C", nrow(dataframe_row))                       # Create new column
  dataframe_row[ , ncol(dataframe_row) + 1] <- full_row                  # Append new column
  colnames(dataframe_row)[ncol(dataframe_row)] <- paste0("full_row", i)  # Rename column name
}

#Temp Strategy dataframe creation
full_row0_tmp = rep("O", 99)
dataframe_str_temp<- data.frame(full_row0_tmp)

for(i in 1:98) {                                   # Head of for-loop
  full_row <- rep("O", nrow(dataframe_str_temp))                       # Create new column
  dataframe_str_temp[ , ncol(dataframe_str_temp) + 1] <- full_row                  # Append new column
  colnames(dataframe_str_temp)[ncol(dataframe_str_temp)] <- paste0("full_row", i)  # Rename column name
}

dataframe_row[[50]][50]<-"D"
dataframe_row # D/C data on the first step

dataframe_str_temp=dataframe_row

#dataframe creation (PAYOFF)
full_row0 = rep(0, 99)
dataframe_payoff<- data.frame(full_row0)

for(i in 1:98) {                                   # Head of for-loop
  full_row <- rep(0, nrow(dataframe_payoff))                       # Create new column
  dataframe_payoff[ , ncol(dataframe_payoff) + 1] <- full_row                  # Append new column
  colnames(dataframe_payoff)[ncol(dataframe_payoff)] <- paste0("full_row", i)  # Rename column name
}
dataframe_payoff
# Nines on the border
for(i in 1:99){
  dataframe_payoff[[1]][i]<-9
  dataframe_payoff[[99]][i]<-9
  dataframe_payoff[[i]][1]<-9
  dataframe_payoff[[i]][99]<-9
}

#CREATION OF 3*3 CALCULATION DATAFRAME
row1 <-c(0,0,0)
row2 <-c(0,0,0)
row3 <-c(0,0,0)
Calc_datafr_3_3 <- data.frame(row1, row2, row3)
Calc_datafr_strategy <- data.frame(row1, row2, row3)

#CREATION OF Visualisation DATAFRAME

Visualisation_dataframe<-matrix(0:0, nrow = 99, ncol = 99) 





#FIRST STAGE
#CALCULATION OF PAYOFF (SUM)
sum_f <- function(proc_place_row,proc_place_col){
r1=0
for (row in (proc_place_row-1):(proc_place_row+1)) {
  for (col in (proc_place_col-1):(proc_place_col+1)) {
    #print(paste('Row', row, 'col', col, 'value', dataframe_row[[row]][col]))
    
    subres <- paste0(dataframe_row[[proc_place_row]][proc_place_col],dataframe_row[[row]][col])
    if(subres == "DC"){
     res=1.9
    }else {
      if(subres == "CC"){
        res=1
      }else{
        if(subres == "CD"){
          res=0}
        else{
          if(subres == "DD"){
            res=0
          }
        }
      }
    }
    r1=r1+res
    #print(r1)
  }
}
return(r1)
}

for (row in 2:98) {
 for (col in 2:98) {
dataframe_payoff[[row]][col] = sum_f(row,col)
}}
dataframe_payoff




#Changing strategy
Dominant_Strat_3_3 <- function(proc_place_row,proc_place_col){
  #proc_place_row=12
  #proc_place_col=12
  r1=0 
  pay=dataframe_payoff[[proc_place_row]][proc_place_col]
  strategy=dataframe_row[[proc_place_row]][proc_place_col]
  for (row in (proc_place_row-1):(proc_place_row+1)) {
    for (col in (proc_place_col-1):(proc_place_col+1)) {
     # print(paste('Row', row, 'col', col, 'value', dataframe_payoff[[row]][col]))
     
      
      if (dataframe_payoff[[row]][col]>pay)
      {pay=dataframe_payoff[[row]][col]
      strategy=dataframe_row[[row]][col]}
      
      
    }
  }
  #print(strategy)
  return(strategy)
}






for (row_dt in 2:98) {
  for (col_dt in 2:98) {

strategy<-Dominant_Strat_3_3(row_dt,col_dt)
    dataframe_str_temp[[row_dt]][col_dt]<-strategy
      }
  }



#VISUALIZATION
# Library
for (row in 2:98) {
  for (col in 2:98) {
    if(dataframe_str_temp[[row]][col]=="D" & dataframe_row[[row]][col]=="D"){Visualisation_dataframe[row,col]=1}
    if(dataframe_str_temp[[row]][col]=="C" & dataframe_row[[row]][col]=="C"){Visualisation_dataframe[row,col]=0} 
    if(dataframe_str_temp[[row]][col]=="D" & dataframe_row[[row]][col]=="C"){Visualisation_dataframe[row,col]=2} 
    if(dataframe_str_temp[[row]][col]=="C" & dataframe_row[[row]][col]=="D"){Visualisation_dataframe[row,col]=3} 
    
    
  }}

rotate <- function(x) t(apply(x, 2, rev))
Visualisation_dataframe_rotated<-rotate(Visualisation_dataframe)


# Library  https://r-charts.com/correlation/heat-map-ggplot2/
# Transform the matrix in long format
library(reshape)
df <- melt(Visualisation_dataframe_rotated)
colnames(df) <- c("x", "y", "value")

# save histogram in jpeg format in current directory
#jpeg(file="D:/lattice.jpeg", width=1000, height=1000)

library(ggplot2)
ggplot(df, aes(x = x, y = y, fill = factor(value))) +   #https://statisticsglobe.com/r-error-continuous-value-supplied-to-discrete-scale
  geom_tile(color = "white",
            lwd = 0.5,
            linetype = 1) +
  coord_fixed()+labs(title = "Epoch")+labs(subtitle = epo)+
  scale_fill_manual(values = c("0"="blue","1"="red", "2"="yellow", "3"="green"))
 epo=epo+1
# call this function to save the file 
#dev.off()



dataframe_row=dataframe_str_temp


