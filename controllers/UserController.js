const User = require('../models/user');
const student = 

module.exports = {
    async createUser(req, res) {
        try {
            const {Name, Email, Senha, telefone, person ,select} = req.body;
            const verificando = await User.findOne({where: {Email}}); //Verificando se o email existe

            if(verificando){
                res.status(401).json({"mensagen": "email já existe!"});
            }else{
                if (person === "Discente") {
                    const discent = await User.createAluno({select});
                } else if (person === "Docente") {
                    const docente = await User.createProfessor({select});
                } else if (select === "Tecnico_ADM") {
                    const tecnicoADM = await User.createTecnicoAdministrativo({select});
                }
                const user = await User.create({Name, Email, Senha, telefone});
                res.status(200).json({"mwnsagem": "Usuario cadastrado"});
            }
        }catch(err){
            res.status(400).json(err);
        }
    }
}