str(warpbreaks)

warpbreaks

m.lm2 <- lm(breaks~wool*tension, data=warpbreaks)
m.glm2<- glm(breaks~wool*tension, data=warpbreaks, family=gaussian)

anova(m.lm)
anova(m.glm, test="F")

str(swiss)

m.lm <- lm(Infant.Mortality~., data=swiss)

m.glmP1 <- glm(Infant.Mortality~1+., data=swiss,family="poisson")
m.glmP2 <- glm(Infant.Mortality~.-1, data=swiss,family="poisson")
m.glmP <- glm(Infant.Mortality~., data=swiss,family="poisson")

m.glmG <- glm(Infant.Mortality~., data=swiss,family="gaussian")

plot(m.glm)

anova(m.lm)
summary(m.lm)
summary(aov(m.lm))

anova(m.glm, test="F")
summary(m.glm, test="F")
summary(aov(m.glm))
m.glm
summary(swiss)

warnings()

help(swiss)

require(stats); require(graphics)
class(pairs(swiss, panel = panel.smooth, main = "swiss data",
      col = 50 + (swiss$Catholic > 50))
)


anova(m.glmP)
anova(m.glmP)
anova(m.glmP,m.glmG)

blabla[lower.tri(blabla)]<-NA


summary(lm(Fertility ~1+. , data = swiss))

help(pairs)


install.packages("texreg")
require(texreg)
screenreg(l = list(m.lm, m.glm,m.glmG,m.glmP,m.glmP1,m.glmP2))




names(swiss)

anova(
lm(Infant.Mortality~Fertility+Catholic, data=swiss))





xx.2 <- as.data.frame(matrix(c(8.788269, 1, 0,
+ 7.964719, 6, 0,
+ 8.204051, 12, 0,
+ 9.041368, 24, 0,
+ 8.181555, 48, 0,
+ 8.041419, 96, 0,
+ 7.992336, 144, 0,
+ 7.948658, 1, 1,
+ 8.090211, 6, 1,
+ 8.031459, 12, 1,
+ 8.118308, 24, 1,
+ 7.699051, 48, 1,
+ 7.537120, 96, 1,
+ 7.268570, 144, 1), byrow=T, ncol=3))

names(xx.2) <- c("value", "time", "treat")

mod1 <- lm(value~time*treat, data=xx.2)
anova(mod1)

mod2 <- aov(value~time*treat, data=xx.2)
anova(mod2)

summary(mod2)
summary(mod2)=
summary(mod1)



 data <- list(value = c (8.788269,7.964719,8.204051,9.041368,8.181555,8.0414149,7.992336,7.948658,8.090211,8.031459,8.118308,7.699051,7.537120,7.268570), time = c(1,6,12,24,48,96,144,1,6,12,24,48,96,144), treat = c(0,0,0,0,0,0,0,1,1,1,1,1,1,1) )
summary( lm(value ~ treat*time, data=data) )
summary( aov(value ~ 1 + treat + time + I(treat*time),data=data) )