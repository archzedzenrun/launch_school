function logger(msg: string | undefined): void {
  if (msg) {
    console.log("Input is defined and not empty");
  }
}

logger('hello');
logger('');
logger(undefined)