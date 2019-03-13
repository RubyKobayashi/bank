# Bank app

**Project Set-Up**

To get project files:
Clone from this Github project onto your local computer

To install gems, type in the command line:
`bundle`

To run tests:
`rspec`

To use linter:
`rubocop`

-----
**Approach:**
I tried to stick to a strict TDD process by taking the time to plan after reading and defining and then to write the first feature test first, followed by unit test. During the process of developing the app, I realised that it makes sense to have a third class - the Printer class so I also implemented this, deviating from the original plan. I tried to stick to SRP and to encapsulate and hide inner working methods into private methods.

**Why code is structured as it is:**
There are 3 classes:
bank
bank_statement
printer

It seemed logical for the bank to handle deposits, withdrawals and updating the balance at any given time and to also make it impossible to let the user withdraw more money than they have. It also records all the user's transaction, thereby amassing a history of transactions.

The bank_statement formats the history of transactions into a bank_statement format.

The Printer prints the bank_statement.

It seemed logical to have a third Printer class so that it would be scaleable to print other documents, should there be a need to, at some point in the future.

**User Stories:**


```
As a User
So I can add money to my bank account
I would like to be able to deposit money
```

```
As a User
So I can use the money in my bank account
I would like to be able to withdraw money
```

```
As a User
So I can see how much money is in my bank account
I would like to be able to see my bank balance on my bank statement
```


```
As a User
So I have a convenient time referenced record
I would like to see transactions on my bank balance in reverse chronological order
```

```
As a User
So I can have a physical record
I would like to print bank statements with dates, type of transaction and bank balance
```

[![Screen Shot 2019-03-13 at 12.12.40](http://i68.tinypic.com/15ps4mx.png)](http://tinypic.com/r/15ps4mx/9)
