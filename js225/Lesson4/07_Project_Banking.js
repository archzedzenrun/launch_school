function makeAccount(number) {
  let transactions = [];
  let balance = 0;

  return {
    number() {
      return number;
    },

    transactions() {
      return transactions;
    },

    balance() {
      return balance;
    },

    deposit(amount) {
      balance += amount;
      transactions.push({ type: 'deposit', amount })
      return amount;
    },

    withdraw(amount) {
      if (amount > balance) {
        amount = balance;
      }

      balance -= amount;
      transactions.push({ type: 'withdraw', amount })
      return amount;

    },
  };
}

function makeBank() {
  let accountNumber = 101;
  let accounts = [];

  return {
    openAccount() {
      let account = makeAccount(accountNumber);
      accountNumber += 1;
      accounts.push(account);
      return account;
    },
    transfer(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    },
  };
}

let bank = makeBank();
let account = bank.openAccount();
console.log(account.balance());
// 0
console.log(account.deposit(17));
// 17
let secondAccount = bank.openAccount();
console.log(secondAccount.number());
// 102
console.log(account.transactions());
// [{...}]
console.log(bank.accounts);


// if ((this.balance - amount) < 0) {       <---- GROSS
//   let newBalance = this.balance;
//   this.balance = 0;
//   return newBalance;
// } else {
//   this.balance -= amount;
//   return amount;
// }