const expressObj = require('express');
const appJenkinsObj = expressObj();

appJenkinsObj.get('/', (req, res) => {
     res.send('Hello User!  your CI/CD pipeline is working.');

});

appJenkinsObj.listen(3000,()=>{
    console.log("Server is running on port 3000");
});