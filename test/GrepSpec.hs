{-# LANGUAGE OverloadedStrings #-}

module GrepSpec where

import           Data.ByteString.Char8
import           Grep
import           Test.Hspec


spec :: Spec
spec =
    describe "grep in string" $ do
        it "should find class" $
            grep "test-class" ("<div class=\"test-class\">Hello World</div>" :: ByteString)
                `shouldBe` [1]

        it "should find multiple classes" $
            grep "test-class" ("<div class=\"test-class\">\nHello World\n<span class=\"test-class2\"</span></div>" :: ByteString)
                `shouldBe` [1, 3]
