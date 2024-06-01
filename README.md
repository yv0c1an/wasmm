* 为了即时同步,远程原仓库为plus  同步代码时输入指令 git fetch plus master:dev (代表从远程库下载并存到dev分支)
* 左下角打开git本地的dev分支后查看远程库的变化情况 再决定要不要进行merge
* 决定合并就在本地master下输入 git merge dev (合并开发分支到主分支上)

// 打标签
git tag -a v2.4.1 -m "完成升级"

// push 标签到远程仓库
git push origin v2.4.1

//下载某个标签版本
git clone -b v2.4.1 https://gitee.com/bkywksj/according-to-35admin-ui.git
### 新建表必备字段


```java
//时间格式化注解 json则使用@JsonFormat 表单则使用@DateTimeFormat
//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
@DateTimeFormat(pattern = "yyyy-MM-dd")
private Date time;
```

```mysql
ALTER TABLE `f_表名` 
ADD COLUMN `create_dept` bigint NULL COMMENT '创建部门',
ADD COLUMN `create_by` bigint NULL COMMENT '创建人' AFTER `create_dept`,
ADD COLUMN `create_time` datetime NULL COMMENT '创建时间' AFTER `create_by`,
ADD COLUMN `update_by` bigint NULL COMMENT '修改人' AFTER `create_time`,
ADD COLUMN `update_time` datetime NULL COMMENT '修改时间' AFTER `update_by`,
ADD COLUMN `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 0 COMMENT '逻辑删除' AFTER `update_time`,
ADD COLUMN `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注' AFTER `del_flag`;
```

```xml
<!--引入本地jar包 ${project.basedir}表示根目录-->
  <dependency>
            <groupId>zidingyi.api</groupId>
            <artifactId>sdk</artifactId>
            <version>1.0</version>
            <scope>system</scope>
            <systemPath>${project.basedir}/src/main/resources/lib/sdk-1.0.jar</systemPath>
        </dependency>
        <!--允许本地的jar包-->
<includeSystemScope>true</includeSystemScope>
```




<img src="https://foruda.gitee.com/images/1679673773341074847/178e8451_1766278.png" width="50%" height="50%">
<div style="height: 10px; clear: both;"></div>

- - -

## 平台简介

[![码云Gitee](https://gitee.com/bkywksj/ruoyi-vue-plus-uniapp/badge/star.svg?theme=blue)](https://gitee.com/bkywksj/ruoyi-vue-plus-uniapp)
[![使用IntelliJ IDEA开发维护](https://img.shields.io/badge/IntelliJ%20IDEA-提供支持-blue.svg)](https://www.jetbrains.com/?from=RuoYi-Vue-Plus)
<br>
[![ruoyi-vue-plus-uniapp](https://img.shields.io/badge/RuoYi_Vue_Plus-4.8.0-success.svg)](https://gitee.com/bkywksj/ruoyi-vue-plus-uniap-uniapp)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-2.7-blue.svg)]()
[![JDK-8+](https://img.shields.io/badge/JDK-8-green.svg)]()
[![JDK-11](https://img.shields.io/badge/JDK-11-green.svg)]()

> ruoyi-vue-plus-uniapp 是 基于RuoYi-Vue-Plus5.x结构重写4.x并整合5.x的优秀功能以及uniapp端开发

> 项目代码、文档 均免费可商用 框架源码不对外出售即可<br>

> 系统演示: [传送门](http://uniapp2024.ruoyikj.top/)

