install.packages("pubmed.mineR")
install.packages("RISmed")
install.packages("qdap")


library(RISmed)
library(qdap)

#=============================================================================================
####			Tips & Tricks
#=============================================================================================

##Para copiar todo o conteúdo para o excel ou txt, basta utilizar a função

x <- "hello world"
writeClipboard(x)

x <- as.character(3:14)
writeClipboard(x)

## O caminho inverso pode ser feito por meio da função "readClipboard()":

readClipboard()

#OK, vamos limpar tudo!
rm(list=ls())

#=============================================================================================
####			Exemplo 1
#=============================================================================================
# Retirado das funções helps a seguir, além de outros "helps" básicos do pacote
help(myeloma); help(AbstractText);Query(myeloma); 
#entre outros helps do pacote (RISmed)
??RISmed
#=============================================================================================

data(myeloma)

#Retorna a forma de busca
Query(myeloma)

help(Query)
#Retorna titulo do artigo
ArticleTitle(myeloma)

#Retorna o titulo da revista
Title(myeloma)

#Extractor for the RefSource of a Medline object
RefSource(myeloma)

#Retorna o volume da revista
Volume(myeloma)

#Retorna o abstact de cada artigo
AbstractText(myeloma)


#Returns the number of Ids from a E-utility query
(myeloma)



###A MESMA BUSCA QUE RESULTOU NO DATA "myeloma" pode ser feita da seguinte forma

Query(myeloma)
 "\"multiple myeloma\"[MeSH Terms] AND 2012/05/08[EDAT] : 2013/05/08[EDAT]"

search_topic<-"\"multiple myeloma\"[MeSH Terms] AND 2012/05/08[EDAT] : 2013/05/08[EDAT]"

search_topic=Query(myeloma)

search_query <- EUtilsSummary(search_topic, retmax=10)

records<- EUtilsGet(search_query)

ArticleTitle(records)

#comparar
ArticleTitle(myeloma)






#=============================================================================================
####			Exemplo 2
#=============================================================================================
# Retirado de: R-bloggers
browseURL("www.r-bloggers.com/how-to-search-pubmed-with-rismed-package-in-r/")
#=============================================================================================

res <- EUtilsSummary("pinkeye", type="esearch", db="pubmed", datetype='pdat', mindate=2000, maxdate=2015, retmax=500)


t<-ArticleTitle(EUtilsGet(res))

#Retorna os títulos de cada artigo encontrado
t


#Coleta os autores de cada artigo
auths<-Author(EUtilsGet(res))

#Retorna o último sobrenome de cada autor
Last<-sapply(auths, function(x)paste(x$LastName))

#Retorna a quantidade de publicações de cada autor
auths2<-as.data.frame(sort(table(unlist(Last)), dec=TRUE))



####Parte 2 - Exemplo 2

fetch <- EUtilsGet(res, type="efetch", db="pubmed")


myFunc<-function(argument){
articles1<-data.frame('Abstract'=AbstractText(fetch), 'Year'=YearPubmed(fetch))
abstracts1<-articles1[which(articles1$Year==argument),]
abstracts1<-data.frame(abstracts1)
abstractsOnly<-as.character(abstracts1$Abstract)
abstractsOnly<-paste(abstractsOnly, sep="", collapse="")
abstractsOnly<-as.vector(abstractsOnly)
abstractsOnly<-strip(abstractsOnly)
stsp<-rm_stopwords(abstractsOnly, stopwords = qdapDictionaries::Top100Words)
ord<-as.data.frame(table(stsp))
ord<-ord[order(ord$Freq, decreasing=TRUE),]
head(ord,20)
}

oSix<-myFunc(2006)
oSeven<-myFunc(2007)
all<-cbind(oSix, oSeven)
names(all)<-c("2006","freq","2007","freq")

all


#=============================================================================================
####			Exemplo 3
#Retirado de:
browseURL("http://amunategui.github.io/pubmed-query/")
#=============================================================================================
search_topic <- 'copd'
search_query <- EUtilsSummary(search_topic, retmax=100, mindate=2012,maxdate=2012)
summary(search_query)

# see the ids of our returned query
QueryId(search_query)

# get actual data from PubMed
records<- EUtilsGet(search_query)
class(records)

# store it
pubmed_data <- data.frame('Title'=ArticleTitle(records),'Abstract'=AbstractText(records))
head(pubmed_data,1)

pubmed_data$Abstract <- as.character(pubmed_data$Abstract)
pubmed_data$Abstract <- gsub(",", " ", pubmed_data$Abstract, fixed = TRUE)

# see what we have
str(pubmed_data)


#=============================================================================================
####			Exemplo 4
#Retirado de: "Tutorial On Meta- Analysis In R:  R useR! Conference 2013"
# Esse link baixa direto o arquivo do Researchgate
browseURL("https://www.researchgate.net/file.PostFileLoader.html?id=57fa0e125
b495243e8563383&assetKey=AS%3A415210872557578%401476005394432")
#=============================================================================================

fit <- EUtilsSummary("rofecoxib[ti]+British Medical Journal[jo]", db = "pubmed")

fit 

QueryTranslation(fit) # Extract the translated query

QueryCount(fit) # Extract the number of matched records


fetch <- EUtilsGet(fit)

getSlots("Medline") # Available methods

ArticleTitle(fetch)[1:5]

PublicationType(fetch)[1:5]

Author(fetch)[[1]]

#A função "Year" não está mais disponivel nessa versão
#Year foi substituido por outras versões como Yearpub; Yearaccepted
min(Year(fetch))		

ArticleTitle(fetch)[Year(fetch) == 2001] # Title of earliest record(s)



AuthorList <- Author(fetch) # Extract list of authors
LastFirst <- sapply(AuthorList, function(x) paste(x$LastName, x$ForeName))
sort(table(unlist(LastFirst)), dec = TRUE)[1:3] # Tabulate & Sort







library(RISmed)
query = "(exome OR whole OR deep OR high-throughput OR (next AND generation) OR (massively AND parallel)) AND sequencing"
ngs_search <- EUtilsSummary(query, type="esearch",db = "pubmed",mindate=1980, maxdate=2000, retmax=30000)
QueryCount(ngs_search)
ngs_records <- EUtilsGet(ngs_search)

Title(ngs_records)

years <- YearAccepted(ngs_records)
ngs_pubs_count <- as.data.frame(table(years))

journal <- MedlineTA(ngs_records)
ngs_journal_count <- as.data.frame(table(journal))
ngs_journal_count_top25 <- ngs_journal_count[order(-ngs_journal_count[,2]),][1:25,]


query <- '"gene sequencing"[Title/Abstract]'
search<-EUtilsSummary(query,type="esearch",db = "pubmed",mindate=2014, maxdate=2014, retmax=20)
str(search)

search
