# frozen_string_literal: true

module VivaWallet
  class Payment

    class << self

      def retrieve(event_id)
        case event_id.to_i
        when 0
          { reason: 'Undefined', explanation: 'System', type: 'System' }
        when 2061
          { reason: '3DS flow incomplete', explanation: 'Browser closed before authentication finished.', type: 'User' }
        when 2062
          { reason: '3DS validation failed', explanation: 'Wrong password or two-factor auth code entered.', type: 'User' }
        when 2108
          { reason: 'Payments Policy Acquiring Restriction', explanation: 'Payments Policy Acquiring Restriction.', type: 'System' }
        when 10001
          { reason: 'Refer to card issuer', explanation: 'The issuing bank prevented the transaction.', type: 'Issuer' }
        when 10003
          { reason: 'Invalid merchant number', explanation: '	Security violation (source is not correct issuer).', type: 'Issuer' }
        when 10004
          { reason: '	Pick up card', explanation: 'The card has been designated as lost or stolen.', type: 'Issuer' }
        when 10005
          { reason: 'Do not honor', explanation: 'The issuing bank declined the transaction without an explanation.', type: 'Issuer' }
        when 10006
          { reason: 'General error', explanation: 'The card issuer has declined the transaction as there is a problem with the card number.', type: 'Issuer' }
        when 10012
          { reason: 'Invalid transaction', explanation: 'The bank has declined the transaction because of an invalid format or field. This indicates the card details were incorrect.', type: 'Issuer' }
        when 10013
          { reason: 'Invalid amount', explanation: 'The card issuer has declined the transaction because of an invalid format or field.', type: 'System' }
        when 10014
          { reason: 'Invalid card number', explanation: 'The card issuer has declined the transaction as the credit card number is incorrectly entered or does not exist.', type: 'User' }
        when 10015
          { reason: 'Invalid issuer', explanation: 'The card issuer doesn\'t exist.', type: 'System' }
        when 10030
          { reason: 'Format error', explanation: 'The card issuer does not recognise the transaction details being entered. This is due to a format error.', type: 'System' }
        when 10041
          { reason: 'Lost card', explanation: 'The card issuer has declined the transaction as the card has been reported lost.', type: 'System' }
        when 10043
          { reason: 'Stolen card', explanation: 'The card has been designated as lost or stolen.', type: 'User' }
        when 10051
          { reason: 'Insufficient funds', explanation: '	The card has insufficient funds to cover the cost of the transaction.', type: 'Issuer' }
        when 10054
          { reason: 'Expired card', explanation: 'The payment gateway declined the transaction because the expiration date is expired or does not match.', type: 'User' }
        when 10057
          { reason: 'Function not permitted to cardholder', explanation: 'The card issuer has declined the transaction as the credit card cannot be used for this type of transaction.', type: 'Issuer' }
        when 10058
          { reason: 'Function not permitted to terminal', explanation: 'The card issuer has declined the transaction as the credit card cannot be used for this type of transaction.', type: 'Issuer' }
        when 10061
          { reason: 'Withdrawal limit exceeded', explanation: 'Exceeds withdrawal amount limit.', type: 'Issuer' }
        when 10062
          { reason: 'Restricted card', explanation: '	The customer\'s bank has declined their card.', type: 'Issuer' }
        when 10063
          { reason: 'Issuer response security violation', explanation: 'Flag raised due to security validation problem.', type: 'Issuer' }
        when 10065
          { reason: 'Soft decline', explanation: 'The issuer requests Strong Customer Authentication. The merchant should retry the transaction after successfully authenticating customer with 3DS first.', type: 'Issuer' }
        when 10070
          { reason: 'Call issuer', explanation: 'Contact card issuer.', type: 'Issuer' }
        when 10075
          { reason: 'PIN entry tries exceeded', explanation: 'Allowable number of PIN tries exceeded.', type: 'User' }
        when 10076
          { reason: 'Invalid / non-existent "to account" specified', explanation: 'Invalid / non-existent OR Invalid / non-existent specified.', type: 'System' }
        when 10096
          { reason: 'System malfunction', explanation: 'A temporary error occurred during the transaction.', type: 'System' }
        when 10200
          { reason: 'Generic error', explanation: 'A temporary error occurred during the transaction.', type: 'System' }
        when 10301
          { reason: 'Soft decline', explanation: 'The issuer requests Strong Customer Authentication. The merchant should retry the transaction after successfully authenticating customer with 3DS first.', type: 'Issuer' }
        else
          { reason: 'Unknown error', explanation: 'Viva Wallet was unable to supply an error reason.', type: 'System' }
        end
      end
    end
  end
end