// config/plugins.js
module.exports = ({ env }) => ({
  'content-type-builder': {
    enabled: true,
  },
  'users-permissions': {
    config: {
      jwtSecret: env('JWT_SECRET'),
    },
  },
});
