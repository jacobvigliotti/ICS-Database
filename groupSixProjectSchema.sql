create database GroupSixProject;
use GroupSixProject;

create table users (
	userID int,
	fname varchar(20),
	lname varchar(20),
	role int,					/*Int for roles. EX) 1 for developer, 2 for Illustrator, 3 for Buyer, ETC... */
	primary key(userID)
	);
	
create table games (
	gameID int,
    gameType int,				/*Int for game type. 1 could represent casual, 2 for competetive. Boolean might work better here, but then id change the attribute name to isCompetetive*/
    gameDate date,
    gameLoc varchar(20),
    primary key(gameID)
    );
	
	
create table sets (
	setID int,
    setName varchar(20),
    setRelease date,
    primary key(setID)
    );
    
create table transactions (
	transID int, 				/*int to represent id of this transaction */
	cardInstID int,				/* int to represent the id of the card instance*/
    initiator int,				/* int to represent the userID of the seller*/
    initiatedOn date, 			/*Not sure if Initiated On meant the date, or somthing else*/
    price float,
    buyer int,					/*int for the UserID of the buyer*/
	foreign key (initiator) references users(userID),
    foreign key (cardInstID) references cardInstances(cardInstID),
    primary key (transID, cardInstID, initiator)
	);
create table decks (
	deckID int,
    deckName varchar(20),
    deckOwner int,
    primary key(deckID)
    );
    
create table cards (
	cardNum int,
	cardSet int,
    cardColor varchar(20),		
    cardType varchar(20),
    cardCreator int,
    primary key(cardNum)
    );
    
create table artworks (
	artID int,
    artFranchise varchar(20),
    artCharacter varchar(20),
    illustrator int,
    primary key(artID)
    );
    
create table cardInstances (
	cardInstID int,
	cardNum int, 
    cardOwner int,
    cardCond int,				/*int to represent condition on a scale of 1 to 5*/
    foreign key (cardNum) references cards(cardNum),
    foreign key (cardOwner) references users(userID),
    primary key(cardInstId, cardNum)
    );
