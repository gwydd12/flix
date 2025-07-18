/*
 *  Copyright 2020 Stephen Tetley
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

mod TestMonoid {

    use Monoid.{empty, combine}

    /////////////////////////////////////////////////////////////////////////////
    // Unit                                                                    //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def unitEmpty01(): Bool = empty() == ()

    @Test
    def unitCombine01(): Bool = combine((), ()) == ()

    /////////////////////////////////////////////////////////////////////////////
    // Int8                                                                    //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def combineInt801(): Bool = combine(0i8, 0i8) == 0i8

    @Test
    def combineInt802(): Bool = combine(1i8, 0i8) == 1i8

    @Test
    def combineInt803(): Bool = combine(0i8, 2i8) == 2i8

    @Test
    def combineInt804(): Bool = combine(1i8, 2i8) == 3i8

    /////////////////////////////////////////////////////////////////////////////
    // Int16                                                                   //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def combineInt1601(): Bool = combine(0i16, 0i16) == 0i16

    @Test
    def combineInt1602(): Bool = combine(1i16, 0i16) == 1i16

    @Test
    def combineInt1603(): Bool = combine(0i16, 2i16) == 2i16

    @Test
    def combineInt1604(): Bool = combine(1i16, 2i16) == 3i16

    /////////////////////////////////////////////////////////////////////////////
    // Int32                                                                   //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def combineInt3201(): Bool = combine(0i32, 0i32) == 0i32

    @Test
    def combineInt3202(): Bool = combine(1i32, 0i32) == 1i32

    @Test
    def combineInt3203(): Bool = combine(0i32, 2i32) == 2i32

    @Test
    def combineInt3204(): Bool = combine(1i32, 2i32) == 3i32

    /////////////////////////////////////////////////////////////////////////////
    // Int64                                                                   //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def combineInt6401(): Bool = combine(0i64, 0i64) == 0i64

    @Test
    def combineInt6402(): Bool = combine(1i64, 0i64) == 1i64

    @Test
    def combineInt6403(): Bool = combine(0i64, 2i64) == 2i64

    @Test
    def combineInt6404(): Bool = combine(1i64, 2i64) == 3i64

    /////////////////////////////////////////////////////////////////////////////
    // BigInt                                                                  //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def combineBigInt01(): Bool = combine(0ii, 0ii) == 0ii

    @Test
    def combineBigInt02(): Bool = combine(1ii, 0ii) == 1ii

    @Test
    def combineBigInt03(): Bool = combine(0ii, 2ii) == 2ii

    @Test
    def combineBigInt04(): Bool = combine(1ii, 2ii) == 3ii

    /////////////////////////////////////////////////////////////////////////////
    // Float32                                                                 //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def combineFloat3201(): Bool = combine(0.0f32, 0.0f32) == 0.0f32

    @Test
    def combineFloat3202(): Bool = combine(1.0f32, 0.0f32) == 1.0f32

    @Test
    def combineFloat3203(): Bool = combine(0.0f32, 2.0f32) == 2.0f32

    @Test
    def combineFloat3204(): Bool = combine(1.0f32, 2.0f32) == 3.0f32

    /////////////////////////////////////////////////////////////////////////////
    // Float64                                                                 //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def combineFloat6401(): Bool = combine(0.0f64, 0.0f64) == 0.0f64

    @Test
    def combineFloat6402(): Bool = combine(1.0f64, 0.0f64) == 1.0f64

    @Test
    def combineFloat6403(): Bool = combine(0.0f64, 2.0f64) == 2.0f64

    @Test
    def combineFloat6404(): Bool = combine(1.0f64, 2.0f64) == 3.0f64

    /////////////////////////////////////////////////////////////////////////////
    // BigDecimal                                                              //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def combineBigDecimal01(): Bool = combine(0.0ff, 0.0ff) == 0.0ff

    @Test
    def combineBigDecimal02(): Bool = combine(1.0ff, 0.0ff) == 1.0ff

    @Test
    def combineBigDecimal03(): Bool = combine(0.0ff, 2.0ff) == 2.0ff

    @Test
    def combineBigDecimal04(): Bool = combine(1.0ff, 2.0ff) == 3.0ff

    /////////////////////////////////////////////////////////////////////////////
    // String                                                                  //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def stringEmpty01(): Bool = empty() == ""

    @Test
    def stringCombine01(): Bool = combine("", "") == ""

    @Test
    def stringCombine02(): Bool = combine("a", "") == "a"

    @Test
    def stringCombine03(): Bool = combine("", "b") == "b"

    @Test
    def stringCombine04(): Bool = combine("a", "b") == "ab"

    /////////////////////////////////////////////////////////////////////////////
    // Option                                                                  //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def optionEmpty01(): Bool = (empty(): Option[Unit]) == None

    @Test
    def optionCombine01(): Bool = (combine(None, None): Option[Unit]) == None

    @Test
    def optionCombine02(): Bool = combine(Some("a"), None) == Some("a")

    @Test
    def optionCombine03(): Bool = combine(None, Some("1")) == Some("1")

    @Test
    def optionCombine04(): Bool = combine(Some("a"), Some("1")) == Some("a1")

    /////////////////////////////////////////////////////////////////////////////
    // Tuple 2                                                                 //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def tuple2Empty01(): Bool = empty() == ("", "")

    @Test
    def tuple2Empty02(): Bool = empty() == ("", ())

    @Test
    def tuple2Combine01(): Bool = combine(("", ""), ("", "")) == ("", "")

    @Test
    def tuple2Combine02(): Bool = combine(("a", "b"), ("", "")) == ("a", "b")

    @Test
    def tuple2Combine03(): Bool = combine(("", ""), ("1", "2")) == ("1", "2")

    @Test
    def tuple2Combine04(): Bool = combine(("a", "b"), ("1", "2")) == ("a1", "b2")

    @Test
    def tuple2Combine05(): Bool = combine(("a", ()), ("1", ())) == ("a1", ())

    /////////////////////////////////////////////////////////////////////////////
    // Tuple 3                                                                 //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def tuple3Empty01(): Bool = empty() == ("", "", "")

    @Test
    def tuple3Empty02(): Bool = empty() == ("", (), "")

    @Test
    def tuple3Combine01(): Bool = combine(("", "", ""), ("", "", "")) == ("", "", "")

    @Test
    def tuple3Combine02(): Bool = combine(("a", "b", "c"), ("", "", "")) == ("a", "b", "c")

    @Test
    def tuple3Combine03(): Bool = combine(("", "", ""), ("1", "2", "3")) == ("1", "2", "3")

    @Test
    def tuple3Combine04(): Bool = combine(("a", "b", "c"), ("1", "2", "3")) == ("a1", "b2", "c3")

    @Test
    def tuple3Combine05(): Bool = combine(("a", (), "b"), ("1", (), "2")) == ("a1", (), "b2")

    /////////////////////////////////////////////////////////////////////////////
    // Tuple 4                                                                 //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def tuple4Empty01(): Bool = empty() == ("", "", "", "")

    @Test
    def tuple4Empty02(): Bool = empty() == ("", (), "", ())

    @Test
    def tuple4Combine01(): Bool = combine(("", "", "", ""), ("", "", "", "")) == ("", "", "", "")

    @Test
    def tuple4Combine02(): Bool = combine(("a", "b", "c", "d"), ("", "", "", "")) == ("a", "b", "c", "d")

    @Test
    def tuple4Combine03(): Bool = combine(("", "", "", ""), ("1", "2", "3", "4")) == ("1", "2", "3", "4")

    @Test
    def tuple4Combine04(): Bool = combine(("a", "b", "c", "d"), ("1", "2", "3", "4")) == ("a1", "b2", "c3", "d4")

    @Test
    def tuple4Combine05(): Bool = combine(("a", (), "b", ()), ("1", (), "2", ())) == ("a1", (), "b2", ())

    /////////////////////////////////////////////////////////////////////////////
    // Tuple 5                                                                 //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def tuple5Empty01(): Bool = empty() == ("", "", "", "", "")

    @Test
    def tuple5Empty02(): Bool = empty() == ("", (), "", (), "")

    @Test
    def tuple5Combine01(): Bool = combine(("", "", "", "", ""), ("", "", "", "", "")) == ("", "", "", "", "")

    @Test
    def tuple5Combine02(): Bool = combine(("a", "b", "c", "d", "e"), ("", "", "", "", "")) == ("a", "b", "c", "d", "e")

    @Test
    def tuple5Combine03(): Bool = combine(("", "", "", "", ""), ("1", "2", "3", "4", "5")) == ("1", "2", "3", "4", "5")

    @Test
    def tuple5Combine04(): Bool = combine(("a", "b", "c", "d", "e"), ("1", "2", "3", "4", "5")) == ("a1", "b2", "c3", "d4", "e5")

    @Test
    def tuple5Combine05(): Bool = combine(("a", (), "b", (), "c"), ("1", (), "2", (), "3")) == ("a1", (), "b2", (), "c3")

    /////////////////////////////////////////////////////////////////////////////
    // Tuple 6                                                                 //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def tuple6Empty01(): Bool = empty() == ("", "", "", "", "", "")

    @Test
    def tuple6Empty02(): Bool = empty() == ("", (), "", (), "", ())

    @Test
    def tuple6Combine01(): Bool = combine(("", "", "", "", "", ""), ("", "", "", "", "", "")) == ("", "", "", "", "", "")

    @Test
    def tuple6Combine02(): Bool = combine(("a", "b", "c", "d", "e", "f"), ("", "", "", "", "", "")) == ("a", "b", "c", "d", "e", "f")

    @Test
    def tuple6Combine03(): Bool = combine(("", "", "", "", "", ""), ("1", "2", "3", "4", "5", "6")) == ("1", "2", "3", "4", "5", "6")

    @Test
    def tuple6Combine04(): Bool = combine(("a", "b", "c", "d", "e", "f"), ("1", "2", "3", "4", "5", "6")) == ("a1", "b2", "c3", "d4", "e5", "f6")

    @Test
    def tuple6Combine05(): Bool = combine(("a", (), "b", (), "c", ()), ("1", (), "2", (), "3", ())) == ("a1", (), "b2", (), "c3", ())

    /////////////////////////////////////////////////////////////////////////////
    // Tuple 7                                                                 //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def tuple7Empty01(): Bool = empty() == ("", "", "", "", "", "", "")

    @Test
    def tuple7Empty02(): Bool = empty() == ("", (), "", (), "", (), "")

    @Test
    def tuple7Combine01(): Bool = combine(("", "", "", "", "", "", ""), ("", "", "", "", "", "", "")) == ("", "", "", "", "", "", "")

    @Test
    def tuple7Combine02(): Bool = combine(("a", "b", "c", "d", "e", "f", "g"), ("", "", "", "", "", "", "")) == ("a", "b", "c", "d", "e", "f", "g")

    @Test
    def tuple7Combine03(): Bool = combine(("", "", "", "", "", "", ""), ("1", "2", "3", "4", "5", "6", "7")) == ("1", "2", "3", "4", "5", "6", "7")

    @Test
    def tuple7Combine04(): Bool = combine(("a", "b", "c", "d", "e", "f", "g"), ("1", "2", "3", "4", "5", "6", "7")) == ("a1", "b2", "c3", "d4", "e5", "f6", "g7")

    @Test
    def tuple7Combine05(): Bool = combine(("a", (), "b", (), "c", (), "d"), ("1", (), "2", (), "3", (), "4")) == ("a1", (), "b2", (), "c3", (), "d4")

    /////////////////////////////////////////////////////////////////////////////
    // Tuple 8                                                                 //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def tuple8Empty01(): Bool = empty() == ("", "", "", "", "", "", "", "")

    @Test
    def tuple8Empty02(): Bool = empty() == ("", (), "", (), "", (), "", ())

    @Test
    def tuple8Combine01(): Bool = combine(("", "", "", "", "", "", "", ""), ("", "", "", "", "", "", "", "")) == ("", "", "", "", "", "", "", "")

    @Test
    def tuple8Combine02(): Bool = combine(("a", "b", "c", "d", "e", "f", "g", "h"), ("", "", "", "", "", "", "", "")) == ("a", "b", "c", "d", "e", "f", "g", "h")

    @Test
    def tuple8Combine03(): Bool = combine(("", "", "", "", "", "", "", ""), ("1", "2", "3", "4", "5", "6", "7", "8")) == ("1", "2", "3", "4", "5", "6", "7", "8")

    @Test
    def tuple8Combine04(): Bool = combine(("a", "b", "c", "d", "e", "f", "g", "h"), ("1", "2", "3", "4", "5", "6", "7", "8")) == ("a1", "b2", "c3", "d4", "e5", "f6", "g7", "h8")

    @Test
    def tuple8Combine05(): Bool = combine(("a", (), "b", (), "c", (), "d", ()), ("1", (), "2", (), "3", (), "4", ())) == ("a1", (), "b2", (), "c3", (), "d4", ())

    /////////////////////////////////////////////////////////////////////////////
    // Tuple 9                                                                 //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def tuple9Empty01(): Bool = empty() == ("", "", "", "", "", "", "", "", "")

    @Test
    def tuple9Empty02(): Bool = empty() == ("", (), "", (), "", (), "", (), "")

    @Test
    def tuple9Combine01(): Bool = combine(("", "", "", "", "", "", "", "", ""), ("", "", "", "", "", "", "", "", "")) == ("", "", "", "", "", "", "", "", "")

    @Test
    def tuple9Combine02(): Bool = combine(("a", "b", "c", "d", "e", "f", "g", "h", "i"), ("", "", "", "", "", "", "", "", "")) == ("a", "b", "c", "d", "e", "f", "g", "h", "i")

    @Test
    def tuple9Combine03(): Bool = combine(("", "", "", "", "", "", "", "", ""), ("1", "2", "3", "4", "5", "6", "7", "8", "9")) == ("1", "2", "3", "4", "5", "6", "7", "8", "9")

    @Test
    def tuple9Combine04(): Bool = combine(("a", "b", "c", "d", "e", "f", "g", "h", "i"), ("1", "2", "3", "4", "5", "6", "7", "8", "9")) == ("a1", "b2", "c3", "d4", "e5", "f6", "g7", "h8", "i9")

    @Test
    def tuple9Combine05(): Bool = combine(("a", (), "b", (), "c", (), "d", (), "e"), ("1", (), "2", (), "3", (), "4", (), "5")) == ("a1", (), "b2", (), "c3", (), "d4", (), "e5")

    /////////////////////////////////////////////////////////////////////////////
    // Tuple 10                                                                //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def tuple10Empty01(): Bool = empty() == ("", "", "", "", "", "", "", "", "", "")

    @Test
    def tuple10Empty02(): Bool = empty() == ("", (), "", (), "", (), "", (), "", ())

    @Test
    def tuple10Combine01(): Bool = combine(("", "", "", "", "", "", "", "", "", ""), ("", "", "", "", "", "", "", "", "", "")) == ("", "", "", "", "", "", "", "", "", "")

    @Test
    def tuple10Combine02(): Bool = combine(("a", "b", "c", "d", "e", "f", "g", "h", "i", "j"), ("", "", "", "", "", "", "", "", "", "")) == ("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")

    @Test
    def tuple10Combine03(): Bool = combine(("", "", "", "", "", "", "", "", "", ""), ("1", "2", "3", "4", "5", "6", "7", "8", "9", "0")) == ("1", "2", "3", "4", "5", "6", "7", "8", "9", "0")

    @Test
    def tuple10Combine04(): Bool = combine(("a", "b", "c", "d", "e", "f", "g", "h", "i", "j"), ("1", "2", "3", "4", "5", "6", "7", "8", "9", "0")) == ("a1", "b2", "c3", "d4", "e5", "f6", "g7", "h8", "i9", "j0")

    @Test
    def tuple10Combine05(): Bool = combine(("a", (), "b", (), "c", (), "d", (), "e", ()), ("1", (), "2", (), "3", (), "4", (), "5", ())) == ("a1", (), "b2", (), "c3", (), "d4", (), "e5", ())

    /////////////////////////////////////////////////////////////////////////////
    // Validation                                                              //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def validationEmpty01(): Bool = (empty(): Validation[String, String]) == Validation.Success("")

    @Test
    def validationCombine01(): Bool = (combine(Validation.Failure(Nec.singleton("e1")), Validation.Failure(Nec.singleton("e2"))): Validation[String, String]) == Validation.Failure(Nec.append(Nec.singleton("e1"), Nec.singleton("e2")))

    @Test
    def validationCombine02(): Bool = (combine(Validation.Success("a"), Validation.Failure(Nec.singleton("e1"))): Validation[String, String]) == Validation.Failure(Nec.singleton("e1"))

    @Test
    def validationCombine03(): Bool = (combine(Validation.Failure(Nec.singleton("e1")), Validation.Success("1")): Validation[String, String]) == Validation.Failure(Nec.singleton("e1"))

    @Test
    def validationCombine04(): Bool = (combine(Validation.Success("a"), Validation.Success("1")): Validation[String, String]) == Validation.Success("a1")

    /////////////////////////////////////////////////////////////////////////////
    // List                                                                    //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def listEmpty01(): Bool = (empty(): List[Int32]) == Nil

    @Test
    def listCombine01(): Bool = (combine(Nil, Nil): List[Int32]) == Nil

    @Test
    def listCombine02(): Bool = combine(1 :: Nil, Nil) == 1 :: Nil

    @Test
    def listCombine03(): Bool = combine(Nil, 2 :: Nil) == 2 :: Nil

    @Test
    def listCombine04(): Bool = combine(1 :: Nil, 2 :: Nil) == 1 :: 2 :: Nil

    @Test
    def listCombine05(): Bool = combine(1 :: 2 :: Nil, 1 :: 2 :: Nil) == 1 :: 2 :: 1 :: 2 :: Nil

    /////////////////////////////////////////////////////////////////////////////
    // Set                                                                     //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def setEmpty01(): Bool = (empty(): Set[Int32]) == Set#{}

    @Test
    def setCombine01(): Bool = (combine(Set#{}, Set#{}): Set[Int32]) == Set#{}

    @Test
    def setCombine02(): Bool = combine(Set#{1}, Set#{}) == Set#{1}

    @Test
    def setCombine03(): Bool = combine(Set#{}, Set#{2}) == Set#{2}

    @Test
    def setCombine04(): Bool = combine(Set#{1}, Set#{2}) == Set#{1, 2}

    @Test
    def setCombine05(): Bool = combine(Set#{1, 2}, Set#{1, 2}) == Set#{1, 2}

    /////////////////////////////////////////////////////////////////////////////
    // Map                                                                     //
    /////////////////////////////////////////////////////////////////////////////

    @Test
    def mapEmpty01(): Bool = (empty(): Map[Int32, String]) == Map#{}

    @Test
    def mapCombine01(): Bool = (combine(Map#{}, Map#{}): Map[Int32, String]) == Map#{}

    @Test
    def mapCombine02(): Bool = combine(Map#{1 => "A"}, Map#{}) == Map#{1 => "A"}

    @Test
    def mapCombine03(): Bool = combine(Map#{}, Map#{1 => "a"}) == Map#{1 => "a"}

    @Test
    def mapCombine04(): Bool = combine(Map#{1 => "A"}, Map#{1 => "a"}) == Map#{1 => "Aa"}

    @Test
    def mapCombine05(): Bool = combine(Map#{1 => "A", 2 => "B", 3 => "C"}, Map#{2 => "b", 3 => "c", 4 => "d"}) == Map#{1 => "A", 2 => "Bb", 3 => "Cc", 4 => "d"}

}

