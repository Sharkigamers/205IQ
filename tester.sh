#/usr/bin/bash
test_exit_status () {
    command ./205IQ $2 $3 $4 $5 &> /dev/null
    if [ $? == $1 ] ; then
        echo -e "\e[1m\e[92m"OK"\e[0m": $2 = $1
    else
        echo -e "\e[1m\e[91m"KO"\e[0m": $2 = $1
    fi
}
test_output () {
    EXPECT=mktemp
    OUTPUT=`command ./205IQ $1 $2 $3 $4 2>&1` # | sed "$1q;d"`
    echo -e $5 > $EXPECT
    echo $OUTPUT | diff - $EXPECT > /dev/null
    if [ $? == 0 ] ; then
        echo -e "\e[1m\e[92m"OK"\e[0m": $2
    else
        echo -e "\e[1m\e[91m"KO"\e[0m": $2 "<" $(<$EXPECT) "\n\t>" $OUTPUT
    fi
    rm -rf $EXPECT
}
echo "> testing status..."
test_exit_status 84 100a 24 90 95
test_exit_status 84 100 24a 90 95
test_exit_status 84 100 24 90a 95
test_exit_status 84 100 24 90 95a
test_exit_status 84 100 24 95 90
test_exit_status 84 -100 15
test_exit_status 84 100 -24
test_exit_status 84 100
test_exit_status 0 100 15
test_exit_status 0 100 24 90 95
test_exit_status 0 100 24 95
echo "> testing output..."
test_output "100" "24" "90" "95" "7.9% of people have an IQ between 90 and 95"
test_output "100" "24" "90" "90" "0.0% of people have an IQ between 90 and 90"
test_output "100" "24" "90" "200" "66.2% of people have an IQ between 90 and 200"
test_output "100" "24" "0" "200" "100.0% of people have an IQ between 0 and 200"
test_output "100" "24" "100" "50.0% of people have an IQ inferior to 100"
test_output "100" "24" "50" "1.9% of people have an IQ inferior to 50"
test_output "100" "24" "20" "0.0% of people have an IQ inferior to 20"
test_output "100" "24" "0 0.00000\n1 0.00000\n2 0.00000\n3 0.00000\n4 0.00001\n5 0.00001\n6 0.00001\n7 0.00001\n8 0.00001\n9 0.00001\n10 0.00001\n11 0.00002\n12 0.00002\n13 0.00002\n14 0.00003\n15 0.00003\n16 0.00004\n17 0.00004\n18 0.00005\n19 0.00006\n20 0.00006\n21 0.00007\n22 0.00008\n23 0.00010\n24 0.00011\n25 0.00013\n26 0.00014\n27 0.00016\n28 0.00018\n29 0.00021\n30 0.00024\n31 0.00027\n32 0.00030\n33 0.00034\n34 0.00038\n35 0.00042\n36 0.00047\n37 0.00053\n38 0.00059\n39 0.00066\n40 0.00073\n41 0.00081\n42 0.00090\n43 0.00099\n44 0.00109\n45 0.00120\n46 0.00132\n47 0.00145\n48 0.00159\n49 0.00174\n50 0.00190\n51 0.00207\n52 0.00225\n53 0.00244\n54 0.00265\n55 0.00287\n56 0.00310\n57 0.00334\n58 0.00359\n59 0.00386\n60 0.00414\n61 0.00444\n62 0.00475\n63 0.00507\n64 0.00540\n65 0.00574\n66 0.00609\n67 0.00646\n68 0.00683\n69 0.00722\n70 0.00761\n71 0.00801\n72 0.00842\n73 0.00883\n74 0.00924\n75 0.00966\n76 0.01008\n77 0.01050\n78 0.01092\n79 0.01134\n80 0.01175\n81 0.01215\n82 0.01255\n83 0.01293\n84 0.01331\n85 0.01367\n86 0.01402\n87 0.01435\n88 0.01467\n89 0.01497\n90 0.01524\n91 0.01549\n92 0.01572\n93 0.01593\n94 0.01611\n95 0.01627\n96 0.01639\n97 0.01649\n98 0.01656\n99 0.01661\n100 0.01662\n101 0.01661\n102 0.01656\n103 0.01649\n104 0.01639\n105 0.01627\n106 0.01611\n107 0.01593\n108 0.01572\n109 0.01549\n110 0.01524\n111 0.01497\n112 0.01467\n113 0.01435\n114 0.01402\n115 0.01367\n116 0.01331\n117 0.01293\n118 0.01255\n119 0.01215\n120 0.01175\n121 0.01134\n122 0.01092\n123 0.01050\n124 0.01008\n125 0.00966\n126 0.00924\n127 0.00883\n128 0.00842\n129 0.00801\n130 0.00761\n131 0.00722\n132 0.00683\n133 0.00646\n134 0.00609\n135 0.00574\n136 0.00540\n137 0.00507\n138 0.00475\n139 0.00444\n140 0.00414\n141 0.00386\n142 0.00359\n143 0.00334\n144 0.00310\n145 0.00287\n146 0.00265\n147 0.00244\n148 0.00225\n149 0.00207\n150 0.00190\n151 0.00174\n152 0.00159\n153 0.00145\n154 0.00132\n155 0.00120\n156 0.00109\n157 0.00099\n158 0.00090\n159 0.00081\n160 0.00073\n161 0.00066\n162 0.00059\n163 0.00053\n164 0.00047\n165 0.00042\n166 0.00038\n167 0.00034\n168 0.00030\n169 0.00027\n170 0.00024\n171 0.00021\n172 0.00018\n173 0.00016\n174 0.00014\n175 0.00013\n176 0.00011\n177 0.00010\n178 0.00008\n179 0.00007\n180 0.00006\n181 0.00006\n182 0.00005\n183 0.00004\n184 0.00004\n185 0.00003\n186 0.00003\n187 0.00002\n188 0.00002\n189 0.00002\n190 0.00001\n191 0.00001\n192 0.00001\n193 0.00001\n194 0.00001\n195 0.00001\n196 0.00001\n197 0.00000\n198 0.00000\n199 0.00000\n200 0.00000\n"