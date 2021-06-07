#!/bin/node

const ProtonMail = require('protonmail-api');

(async () => {
  const pm = await ProtonMail.connect({
    username: 'codysork@protonmail.com',
    password: 'ÇCs«¡x4ì¡9Óå7Tuác2PA'
  })

// Get emails from inbox
const emailsInInbox= await pm.getEmails('inbox')
const emailCount = Object.keys(emailsInInbox).length

if (emailCount === 0) {
  console.log("﫮 ")
}
else {
  console.log(" " + emailCount)
}

pm.close()
})()

