const nodemailer = require("nodemailer");

module.exports.sendmail = async function (str, data) {
    const transporter = nodemailer.createTransport({
        host: "smtp.gmail.com",
        port: 465,
        secure: true,
        auth: {
            user: "hitanshagrawal@gmail.com",
            pass: "dbpapgmhrhcqpfhi",
        },
    });

    var osubject, otext, ohtml;
    if (str == 'signup') {
        osubject = `Thank you for signing ${data.name}`;
        ohtml = `<h1>Welcome to Onlinedabba.com</h1>
        <p>Hope you have a good time!</p>
        <p>Here are your details:</p>
        <ul>
            <li>Name: ${data.name}</li>
            <li>Email: ${data.email}</li>
        </ul>`;
    } else {
        osubject = `Reset Password`;
        ohtml = `
        <h1>OnlineDabba.com</h1>
        <p><h1>Here is your link to reset your password:</h1></p>
        <p>${data.reset_token_link}</p>`;
    }
    
    let info = await transporter.sendMail({
        from: '"OnlineDabba🍱" <hitanshagrawal@gmail.com>',
        to: data.email,
        subject: osubject,
        html: ohtml
    });
    
    console.log('Message sent: %s', info.messageId);
}
