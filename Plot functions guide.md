Hi everybody!

I'm studying how some functions behave and how could be useful express theoretical plots using R.
If you want to contribute with more examples please add your commmits 


# Example 1
eq = function(x){x^-11}
plot(eq(-10:10), type='l')



# Example 2
curve(x^2, from=1, to=10, , xlab="x", ylab="y")

# Example 3: Surface plots
An example get directly from "help(plot.surface)"

library(fields)

x<- seq( -2,2,,80)
y<- seq( -2,2,,80)

#a lazy way to create some test image
z<- outer( x,y, "+")

#create basic image/surface object
obj<- list(x=x, y=y,z=z)

#basic contour plot
#note how graphical parameters appropriate to contour are passed
plot.surface( obj, type="c", col="red")

#using a fields function to fit a surface and evaluate as surface object.
fit<- Tps( BD[,1:4], BD$lnya) # fit surface to data 
#surface of variables 2 and 3 holding 1 and 4 fixed at their median levels
 out.p<-predictSurface(fit, xy=c(2,3))  

 plot.surface(out.p) # surface plot  


will continuous....

Good sources:

[Todos os tipos de distribuções](http://www.amydotnet.com/StatModels/index_code.html) 
