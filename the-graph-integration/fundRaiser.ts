// import { Payment, FundWithdrawal } from "../generated/schema";
// import { PaymentMade, FundWithdrawn } from "../generated/NSMQFundraiser/NSMQFundraiser";
// import { BigInt } from "@graphprotocol/graph-ts";

// export function handlePaymentMade(event: PaymentMade): void {
//   let payment = new Payment(event.transaction.hash.toHex());
//   payment.participant = event.params.participant;
//   payment.amount = event.params.amount;
//   payment.timestamp = event.block.timestamp;
//   payment.save();
// }

// export function handleFundWithdrawn(event: FundWithdrawn): void {
//   let withdrawal = new FundWithdrawal(event.transaction.hash.toHex());
//   withdrawal.owner = event.params.owner;
//   withdrawal.amount = event.params.amount;
//   withdrawal.timestamp = event.block.timestamp;
//   withdrawal.save();
// }
