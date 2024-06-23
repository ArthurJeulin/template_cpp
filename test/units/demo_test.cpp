// **********************************************************
//      2024 : Arthur JEULIN
//      Copyright (c) Arthur JEULIN 
//      Created by Arthur JEULIN on 06/22/2024.
// **********************************************************
//
// Module : Demonstrate how to use GTest
//

#include <gtest/gtest.h>


namespace{
  int GetMeaningOfLife(){ return 42;}
}

TEST(TestTopic, TrivialEquality){
    EXPECT_EQ(GetMeaningOfLife(),42); 
}

// Demonstrate some basic assertions.
TEST(HelloTest, BasicAssertions) {
  // Expect two strings not to be equal.
  EXPECT_STRNE("hello", "world");
  std::cout << " Coucou" << std::endl;
  // Expect equality.
  ASSERT_EQ(7 * 6, 42);
}

TEST(TestTopic, MoreEqualityTests){
    EXPECT_EQ(GetMeaningOfLife(),42);
    EXPECT_FLOAT_EQ(23.23F,23.23F);
}

int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
