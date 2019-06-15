# Parse HTTP Request Challenge

Here is your morning challenge:

Parse a HTTP Request. Here is a resource that will help --
https://www.ibm.com/support/knowledgecenter/en/SSGMCP_4.2.0/com.ibm.cics.ts.internet.doc/topics/dfhtl21.html

My suggestion would be to start by breaking the request into its bigger components, and then break up each of those components during the second pass (that is, start with the three main elements as these are the most important to understand - sorting out all the various headers is of secondary concern).

## *Beast*
Make sure you take into account the optional fields. A little research will garner more information that can help to validate a request (some types of request have a body, and some do not.)

## *Beast++*
You guessed it: do the same for the response object --
https://www.ibm.com/support/knowledgecenter/en/SSGMCP_4.2.0/com.ibm.cics.ts.internet.doc/topics/dfhtl22.html

This is also a good resource --
https://www.webnots.com/what-is-http/