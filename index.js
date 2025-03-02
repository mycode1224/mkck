const express = require('express');
const multer = require('multer');
const qrnode = require('qrnode');
const ejs = require('ejs');

function decodeQr(path){
    return new Promise((resolve, _)=>{
        return qrnode.detect(path, (data) => {
            resolve(data);
        });
    })
}

const app = express();
const upload = multer({ dest: 'uploads/', limits: { fileSize: 10000 }} );

app.set('view engine', 'ejs');
app.set('views', 'views');

app.get('/', (req, res) => {
    res.render('index');
});

app.post('/upload', upload.single('qrcode'), async (req, res) => {
    try {
        const qrCode = await decodeQr(req.file.path);
        if(qrCode.startsWith('http') || qrCode.startsWith('https')){
            res.send(ejs.render(`<script>window.location.href = '${qrCode}';</script>`));
        }else{
            res.send(ejs.render(`<script>window.location.href = 'https://www.google.com/search?q=${qrCode}';</script>`));
        }
    } catch (error) {
        res.send('Error');
    }
});

app.listen(3000, () => console.log('Server is running on port 3000'));

