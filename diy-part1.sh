#!/bin/bash

# 添加UA2F
git clone https://github.com/Zxilly/UA2F package/UA2F
cd package/UA2F
git checkout 20210531T234622
cd ../..
# 更新queue
git clone https://github.com/openwrt/packages
rm -rf package/libs/libnetfilter-queue
# cp命令方便本地使用
cp -rf packages/libs/libnetfilter-queue package/libs/

# 修改内核设置,不直接全部追加的原因是看起来不舒服
echo "CONFIG_IP_SET=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_IP_SET_HASH_IPPORT=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_IP_SET_MAX=256" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NETFILTER=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NETFILTER_FAMILY_ARP=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NETFILTER_FAMILY_BRIDGE=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NETFILTER_NETLINK=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NETFILTER_NETLINK_GLUE_CT=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NETFILTER_NETLINK_LOG=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NETFILTER_XTABLES=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NFT_REJECT=m" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NFT_REJECT_IPV4=m" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NF_CONNTRACK=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NF_CONNTRACK_LABELS=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NF_CT_NETLINK=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NF_DEFRAG_IPV4=y" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NF_REJECT_IPV4=m" >> target/linux/ramips/mt7620/config-5.4
echo "CONFIG_NF_TABLES=y" >> target/linux/ramips/mt7620/config-5.4
