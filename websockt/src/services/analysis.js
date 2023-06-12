const { Analysis: AnalysisModel } = require("../models/Analysis");

module.exports = {
    async create(data)  {
  
       console.log(data);
       
       const analysis = AnalysisModel({
           ph: data.ph
        });

       await analysis.save();
    }
}