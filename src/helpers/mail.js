const nodemailer = require("nodemailer");
const { google } = require("googleapis");
const fs = require("fs");
const mustache = require("mustache");

const clientId =
  "483277467523-bvu8n7fjvq470fs95f9pb7dne6hlodjs.apps.googleusercontent.com";
const clientSecret = "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";
const refreshToken =
  "1//04j8OIfX7ZCepCgYIARAAGAQSNwF-L9Ir9yJsX9IIlTJ-P7gsEWshB9d58zqS8-csmz8odtyenMxMeMV2JX3HsHng3g5Hhzajo60";

// const clientId = process.env.MAIL_CLIENT_ID;
// const clientSecret = process.env.MAIL_CLIENT_SECRET;
// const refreshToken = process.env.MAIL_REFRESH_TOKEN;

const { OAuth2 } = google.auth;
const OAuth2Client = new OAuth2(clientId, clientSecret);
OAuth2Client.setCredentials({
  refresh_token: refreshToken,
});

module.exports = {
  sendMail: (data) =>
    new Promise((resolve, reject) => {
      const accessToken = OAuth2Client.getAccessToken;

      const transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
          type: "OAuth2",
          user: "lutasdev@gmail.com",
          clientId,
          clientSecret,
          refreshToken,
          accessToken,
        },
      });

      const fileTemplate = fs.readFileSync(
        `src/templates/email/${data.template}`,
        "utf8"
      );
      //   console.log(fileTemplate);

      const mailOptions = {
        from: '"Flixio" <lutasdev@gmail.com>', // sender address
        to: data.to, // list of receivers
        subject: data.subject, // Subject line
        html: mustache.render(fileTemplate, { ...data }),
      };

      transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
          reject(error);
        } else {
          resolve(info);
        }
      });
    }),
};
