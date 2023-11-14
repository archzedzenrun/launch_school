function transactionsFor(itemId, transactions) {
  return transactions.filter(transaction => transaction.id === itemId);
}

function isItemAvailable(itemId, transactions) {
  let filteredTransactions = transactionsFor(itemId, transactions);
  let quantity = filteredTransactions.reduce((sum, transaction) => {
    if (transaction.movement === 'in') {
      sum += transaction.quantity;
    } else {
      sum -= transaction.quantity;
    }

    return sum;
  }, 0);

  return quantity > 0;
}

const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions));     // false
console.log(isItemAvailable(105, transactions));     // true