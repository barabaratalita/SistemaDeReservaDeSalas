const {Router} = require('express');
const router = Router();
const UserController = require('../controllers/UserController');

router.get('/login-user', (req, res) => {
    res.render('login')
});

router.get('/register-user', (req, res) => {
    res.render('register');
});

router.post('/login')
router.post('/register', UserController.createUser);

module.exports = router;