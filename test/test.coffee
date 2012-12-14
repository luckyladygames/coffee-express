should = require "should"

describe "`cake test`", -> 
    it "should succesfully pass this test", -> 

        should.not.exist null
        1.should.equal 1
        true.should.be.true
        false.should.be.false


