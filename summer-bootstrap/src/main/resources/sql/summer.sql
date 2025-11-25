/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.30 : Database - summer
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`summer` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `summer`;

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` int(11) DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  KEY `ACT_IDX_BYTEARRAY_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_BYTEARRAY_RM_TIME` (`REMOVAL_TIME_`),
  KEY `ACT_IDX_BYTEARRAY_NAME` (`NAME_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`,`TENANT_ID_`,`TYPE_`,`CREATE_TIME_`,`ROOT_PROC_INST_ID_`,`REMOVAL_TIME_`) values ('98735cab-d8a6-11eb-b88f-ca09a85df480',1,'1','9873359a-d8a6-11eb-b88f-ca09a85df480','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<bpmn:definitions xmlns:bpmn=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n                  xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n                  xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\"\r\n                  xmlns:bpe=\"https://cdyineng.bpe/1.0/bpmn\"\r\n                  xmlns:camunda=\"https://camunda.org/schema/1.0/bpmn\"\r\n                  xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n                  xmlns:modeler=\"https://camunda.org/schema/modeler/1.0\"\r\n                  id=\"Definitions_16zbvg6\" targetNamespace=\"http://bpmn.io/schema/bpmn\" exporter=\"Camunda Modeler\" exporterVersion=\"4.8.0\" modeler:executionPlatform=\"Camunda Platform\" modeler:executionPlatformVersion=\"7.15.0\">\r\n  <bpmn:process id=\"reject_inline\" isExecutable=\"true\">\r\n    <bpmn:startEvent id=\"StartEvent_1\">\r\n      <bpmn:outgoing>Flow_1dqehhy</bpmn:outgoing>\r\n    </bpmn:startEvent>\r\n    <bpmn:sequenceFlow id=\"Flow_1dqehhy\" sourceRef=\"StartEvent_1\"     targetRef=\"Activity_00k8apd\"/>\r\n    <bpmn:sequenceFlow id=\"Flow_1p8s2b1\" sourceRef=\"Activity_00k8apd\" targetRef=\"Gateway_1jehq0j\" />\r\n    <bpmn:parallelGateway id=\"Gateway_1jehq0j\">\r\n      <bpmn:incoming>Flow_1p8s2b1</bpmn:incoming>\r\n      <bpmn:outgoing>Flow_0b8g5b8</bpmn:outgoing>\r\n      <bpmn:outgoing>Flow_1bc14ea</bpmn:outgoing>\r\n    </bpmn:parallelGateway>\r\n\r\n    <bpmn:sequenceFlow id=\"Flow_0b8g5b8\" sourceRef=\"Gateway_1jehq0j\" targetRef=\"Activity_19w7110\" />\r\n    <bpmn:sequenceFlow id=\"Flow_1bc14ea\" sourceRef=\"Gateway_1jehq0j\" targetRef=\"Activity_00y7n13\" />\r\n    <bpmn:userTask id=\"Activity_00k8apd\" name=\"one\" camunda:assignee=\"one\" >\r\n      <bpmn:incoming>Flow_1dqehhy</bpmn:incoming>\r\n      <bpmn:outgoing>Flow_1p8s2b1</bpmn:outgoing>\r\n    </bpmn:userTask>\r\n    <bpmn:userTask id=\"Activity_19w7110\" name=\"three\" camunda:assignee=\"three\" bpe:type=\"bpe-type-value\">\r\n      <bpmn:incoming>Flow_0b8g5b8</bpmn:incoming>\r\n      <bpmn:outgoing>Flow_0o90d6h</bpmn:outgoing>\r\n    </bpmn:userTask>\r\n    <bpmn:userTask id=\"Activity_00y7n13\" name=\"five\" camunda:assignee=\"five\">\r\n      <bpmn:incoming>Flow_1bc14ea</bpmn:incoming>\r\n      <bpmn:outgoing>Flow_0ivw3ww</bpmn:outgoing>\r\n    </bpmn:userTask>\r\n    <bpmn:sequenceFlow id=\"Flow_0o90d6h\" sourceRef=\"Activity_19w7110\" targetRef=\"Gateway_0hsenf6\" />\r\n    <bpmn:sequenceFlow id=\"Flow_0ivw3ww\" sourceRef=\"Activity_00y7n13\" targetRef=\"Gateway_0hsenf6\" />\r\n    <bpmn:parallelGateway id=\"Gateway_0hsenf6\">\r\n      <bpmn:incoming>Flow_0o90d6h</bpmn:incoming>\r\n      <bpmn:incoming>Flow_0ivw3ww</bpmn:incoming>\r\n      <bpmn:outgoing>Flow_083nlrk</bpmn:outgoing>\r\n    </bpmn:parallelGateway>\r\n    <bpmn:sequenceFlow id=\"Flow_083nlrk\" sourceRef=\"Gateway_0hsenf6\" targetRef=\"Activity_1k30ynh\" />\r\n    <bpmn:endEvent id=\"Event_1q7ee2c\">\r\n      <bpmn:incoming>Flow_1in70gr</bpmn:incoming>\r\n    </bpmn:endEvent>\r\n    <bpmn:sequenceFlow id=\"Flow_1in70gr\" sourceRef=\"Activity_1k30ynh\" targetRef=\"Event_1q7ee2c\" />\r\n    <bpmn:userTask id=\"Activity_1k30ynh\" name=\"six\">\r\n      <bpmn:incoming>Flow_083nlrk</bpmn:incoming>\r\n      <bpmn:outgoing>Flow_1in70gr</bpmn:outgoing>\r\n    </bpmn:userTask>\r\n  </bpmn:process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_1\">\r\n    <bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"reject_inline\">\r\n      <bpmndi:BPMNEdge id=\"Flow_1in70gr_di\" bpmnElement=\"Flow_1in70gr\">\r\n        <di:waypoint x=\"1110\" y=\"175\" />\r\n        <di:waypoint x=\"1207\" y=\"175\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"Flow_083nlrk_di\" bpmnElement=\"Flow_083nlrk\">\r\n        <di:waypoint x=\"945\" y=\"175\" />\r\n        <di:waypoint x=\"1010\" y=\"175\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"Flow_0ivw3ww_di\" bpmnElement=\"Flow_0ivw3ww\">\r\n        <di:waypoint x=\"730\" y=\"290\" />\r\n        <di:waypoint x=\"920\" y=\"290\" />\r\n        <di:waypoint x=\"920\" y=\"200\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"Flow_0o90d6h_di\" bpmnElement=\"Flow_0o90d6h\">\r\n        <di:waypoint x=\"730\" y=\"100\" />\r\n        <di:waypoint x=\"920\" y=\"100\" />\r\n        <di:waypoint x=\"920\" y=\"150\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"Flow_1bc14ea_di\" bpmnElement=\"Flow_1bc14ea\">\r\n        <di:waypoint x=\"450\" y=\"202\" />\r\n        <di:waypoint x=\"450\" y=\"290\" />\r\n        <di:waypoint x=\"630\" y=\"290\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"Flow_0b8g5b8_di\" bpmnElement=\"Flow_0b8g5b8\">\r\n        <di:waypoint x=\"450\" y=\"152\" />\r\n        <di:waypoint x=\"450\" y=\"100\" />\r\n        <di:waypoint x=\"630\" y=\"100\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"Flow_1p8s2b1_di\" bpmnElement=\"Flow_1p8s2b1\">\r\n        <di:waypoint x=\"370\" y=\"177\" />\r\n        <di:waypoint x=\"425\" y=\"177\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge id=\"Flow_1dqehhy_di\" bpmnElement=\"Flow_1dqehhy\">\r\n        <di:waypoint x=\"215\" y=\"177\" />\r\n        <di:waypoint x=\"270\" y=\"177\" />\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1\">\r\n        <dc:Bounds x=\"179\" y=\"159\" width=\"36\" height=\"36\" />\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"Gateway_18sz08b_di\" bpmnElement=\"Gateway_1jehq0j\">\r\n        <dc:Bounds x=\"425\" y=\"152\" width=\"50\" height=\"50\" />\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"Activity_0xi53nu_di\" bpmnElement=\"Activity_00k8apd\">\r\n        <dc:Bounds x=\"270\" y=\"137\" width=\"100\" height=\"80\" />\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"Gateway_0zw14al_di\" bpmnElement=\"Gateway_0hsenf6\">\r\n        <dc:Bounds x=\"895\" y=\"150\" width=\"50\" height=\"50\" />\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"Event_1q7ee2c_di\" bpmnElement=\"Event_1q7ee2c\">\r\n        <dc:Bounds x=\"1207\" y=\"157\" width=\"36\" height=\"36\" />\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"Activity_1ng3bz9_di\" bpmnElement=\"Activity_19w7110\">\r\n        <dc:Bounds x=\"630\" y=\"60\" width=\"100\" height=\"80\" />\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"Activity_06th4oq_di\" bpmnElement=\"Activity_00y7n13\">\r\n        <dc:Bounds x=\"630\" y=\"250\" width=\"100\" height=\"80\" />\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape id=\"Activity_0wtnqy8_di\" bpmnElement=\"Activity_1k30ynh\">\r\n        <dc:Bounds x=\"1010\" y=\"135\" width=\"100\" height=\"80\" />\r\n      </bpmndi:BPMNShape>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</bpmn:definitions>\r\n',0,NULL,1,'2021-06-29 14:52:40',NULL,NULL);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('camunda.installation.id','0bad24d1-c3ac-4add-ac4c-26fb93f29eda',1),('camunda.telemetry.enabled','null',1),('camunda.telemetry.initial.message.sent','true',1),('deployment.lock','0',1),('history.cleanup.job.lock','0',1),('historyLevel','3',1),('installationId.lock','0',1),('next.dbid','1',1),('schema.history','create(fox)',1),('schema.version','fox',1),('startup.lock','0',1),('telemetry.lock','0',1);

/*Table structure for table `act_ge_schema_log` */

DROP TABLE IF EXISTS `act_ge_schema_log`;

CREATE TABLE `act_ge_schema_log` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIMESTAMP_` datetime DEFAULT NULL,
  `VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_schema_log` */

insert  into `act_ge_schema_log`(`ID_`,`TIMESTAMP_`,`VERSION_`) values ('0','2021-06-02 17:44:23','7.15.0');

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PARENT_ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `ACT_INST_STATE_` int(11) DEFAULT NULL,
  `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACTINST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START_END` (`START_TIME_`,`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_COMP` (`EXECUTION_ID_`,`ACT_ID_`,`END_TIME_`,`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_STATS` (`PROC_DEF_ID_`,`PROC_INST_ID_`,`ACT_ID_`,`END_TIME_`,`ACT_INST_STATE_`),
  KEY `ACT_IDX_HI_ACT_INST_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
  KEY `ACT_IDX_HI_AI_PDEFID_END_TIME` (`PROC_DEF_ID_`,`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ATTACHMENT_CONTENT` (`CONTENT_ID_`),
  KEY `ACT_IDX_HI_ATTACHMENT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_ATTACHMENT_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_ATTACHMENT_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_ATTACHMENT_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_batch` */

DROP TABLE IF EXISTS `act_hi_batch`;

CREATE TABLE `act_hi_batch` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOTAL_JOBS_` int(11) DEFAULT NULL,
  `JOBS_PER_SEED_` int(11) DEFAULT NULL,
  `INVOCATIONS_PER_JOB_` int(11) DEFAULT NULL,
  `SEED_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `MONITOR_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_HI_BAT_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_batch` */

/*Table structure for table `act_hi_caseactinst` */

DROP TABLE IF EXISTS `act_hi_caseactinst`;

CREATE TABLE `act_hi_caseactinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PARENT_ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `CASE_ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CASE_ACT_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `STATE_` int(11) DEFAULT NULL,
  `REQUIRED_` tinyint(1) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_CAS_A_I_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_HI_CAS_A_I_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_CAS_A_I_COMP` (`CASE_ACT_ID_`,`END_TIME_`,`ID_`),
  KEY `ACT_IDX_HI_CAS_A_I_CASEINST` (`CASE_INST_ID_`,`CASE_ACT_ID_`),
  KEY `ACT_IDX_HI_CAS_A_I_TENANT_ID` (`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_caseactinst` */

/*Table structure for table `act_hi_caseinst` */

DROP TABLE IF EXISTS `act_hi_caseinst`;

CREATE TABLE `act_hi_caseinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `CREATE_TIME_` datetime NOT NULL,
  `CLOSE_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `STATE_` int(11) DEFAULT NULL,
  `CREATE_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_CASE_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `CASE_INST_ID_` (`CASE_INST_ID_`),
  KEY `ACT_IDX_HI_CAS_I_CLOSE` (`CLOSE_TIME_`),
  KEY `ACT_IDX_HI_CAS_I_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_CAS_I_TENANT_ID` (`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_caseinst` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_COMMENT_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_COMMENT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_COMMENT_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_COMMENT_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_dec_in` */

DROP TABLE IF EXISTS `act_hi_dec_in`;

CREATE TABLE `act_hi_dec_in` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `DEC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `CLAUSE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CLAUSE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DEC_IN_INST` (`DEC_INST_ID_`),
  KEY `ACT_IDX_HI_DEC_IN_CLAUSE` (`DEC_INST_ID_`,`CLAUSE_ID_`),
  KEY `ACT_IDX_HI_DEC_IN_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DEC_IN_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_dec_in` */

/*Table structure for table `act_hi_dec_out` */

DROP TABLE IF EXISTS `act_hi_dec_out`;

CREATE TABLE `act_hi_dec_out` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `DEC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `CLAUSE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CLAUSE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RULE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RULE_ORDER_` int(11) DEFAULT NULL,
  `VAR_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DEC_OUT_INST` (`DEC_INST_ID_`),
  KEY `ACT_IDX_HI_DEC_OUT_RULE` (`RULE_ORDER_`,`CLAUSE_ID_`),
  KEY `ACT_IDX_HI_DEC_OUT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DEC_OUT_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_dec_out` */

/*Table structure for table `act_hi_decinst` */

DROP TABLE IF EXISTS `act_hi_decinst`;

CREATE TABLE `act_hi_decinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `DEC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `DEC_DEF_KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `DEC_DEF_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EVAL_TIME_` datetime NOT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  `COLLECT_VALUE_` double DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_DEC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DEC_REQ_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DEC_REQ_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DEC_INST_ID` (`DEC_DEF_ID_`),
  KEY `ACT_IDX_HI_DEC_INST_KEY` (`DEC_DEF_KEY_`),
  KEY `ACT_IDX_HI_DEC_INST_PI` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DEC_INST_CI` (`CASE_INST_ID_`),
  KEY `ACT_IDX_HI_DEC_INST_ACT` (`ACT_ID_`),
  KEY `ACT_IDX_HI_DEC_INST_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DEC_INST_TIME` (`EVAL_TIME_`),
  KEY `ACT_IDX_HI_DEC_INST_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_HI_DEC_INST_ROOT_ID` (`ROOT_DEC_INST_ID_`),
  KEY `ACT_IDX_HI_DEC_INST_REQ_ID` (`DEC_REQ_ID_`),
  KEY `ACT_IDX_HI_DEC_INST_REQ_KEY` (`DEC_REQ_KEY_`),
  KEY `ACT_IDX_HI_DEC_INST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DEC_INST_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_decinst` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `VAR_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `OPERATION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  `INITIAL_` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_CASE_EXEC` (`CASE_EXECUTION_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
  KEY `ACT_IDX_HI_DETAIL_BYTEAR` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_HI_DETAIL_RM_TIME` (`REMOVAL_TIME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_BYTEAR` (`BYTEARRAY_ID_`,`TASK_ID_`),
  KEY `ACT_IDX_HI_DETAIL_VAR_INST_ID` (`VAR_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_ext_task_log` */

DROP TABLE IF EXISTS `act_hi_ext_task_log`;

CREATE TABLE `act_hi_ext_task_log` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIMESTAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EXT_TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `TOPIC_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `WORKER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` bigint(20) NOT NULL DEFAULT '0',
  `ERROR_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ERROR_DETAILS_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `STATE_` int(11) DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_HI_EXT_TASK_LOG_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_HI_EXT_TASK_LOG_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_HI_EXT_TASK_LOG_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_HI_EXT_TASK_LOG_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
  KEY `ACT_HI_EXT_TASK_LOG_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_HI_EXTTASKLOG_ERRORDET` (`ERROR_DETAILS_ID_`),
  KEY `ACT_HI_EXT_TASK_LOG_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_ext_task_log` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIMESTAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `OPERATION_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
  KEY `ACT_IDX_HI_IDENT_LINK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LINK_RM_TIME` (`REMOVAL_TIME_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TIMESTAMP` (`TIMESTAMP_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_incident` */

DROP TABLE IF EXISTS `act_hi_incident`;

CREATE TABLE `act_hi_incident` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `END_TIME_` timestamp NULL DEFAULT NULL,
  `INCIDENT_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `INCIDENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FAILED_ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HISTORY_CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `INCIDENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ANNOTATION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_INCIDENT_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_HI_INCIDENT_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
  KEY `ACT_IDX_HI_INCIDENT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_INCIDENT_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_INCIDENT_RM_TIME` (`REMOVAL_TIME_`),
  KEY `ACT_IDX_HI_INCIDENT_CREATE_TIME` (`CREATE_TIME_`),
  KEY `ACT_IDX_HI_INCIDENT_END_TIME` (`END_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_incident` */

/*Table structure for table `act_hi_job_log` */

DROP TABLE IF EXISTS `act_hi_job_log`;

CREATE TABLE `act_hi_job_log` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIMESTAMP_` datetime NOT NULL,
  `JOB_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `JOB_DUEDATE_` datetime DEFAULT NULL,
  `JOB_RETRIES_` int(11) DEFAULT NULL,
  `JOB_PRIORITY_` bigint(20) NOT NULL DEFAULT '0',
  `JOB_EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `JOB_EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `JOB_STATE_` int(11) DEFAULT NULL,
  `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `JOB_DEF_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `JOB_DEF_CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FAILED_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `HOSTNAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_JOB_LOG_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_JOB_LOG_PROCINST` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_IDX_HI_JOB_LOG_PROCDEF` (`PROCESS_DEF_ID_`),
  KEY `ACT_IDX_HI_JOB_LOG_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_HI_JOB_LOG_JOB_DEF_ID` (`JOB_DEF_ID_`),
  KEY `ACT_IDX_HI_JOB_LOG_PROC_DEF_KEY` (`PROCESS_DEF_KEY_`),
  KEY `ACT_IDX_HI_JOB_LOG_EX_STACK` (`JOB_EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_HI_JOB_LOG_RM_TIME` (`REMOVAL_TIME_`),
  KEY `ACT_IDX_HI_JOB_LOG_JOB_CONF` (`JOB_DEF_CONFIGURATION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_job_log` */

/*Table structure for table `act_hi_op_log` */

DROP TABLE IF EXISTS `act_hi_op_log`;

CREATE TABLE `act_hi_op_log` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `JOB_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIMESTAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `OPERATION_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `OPERATION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_TYPE_` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `PROPERTY_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ORG_VALUE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `NEW_VALUE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXTERNAL_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ANNOTATION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_OP_LOG_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_OP_LOG_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_OP_LOG_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_HI_OP_LOG_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_OP_LOG_RM_TIME` (`REMOVAL_TIME_`),
  KEY `ACT_IDX_HI_OP_LOG_TIMESTAMP` (`TIMESTAMP_`),
  KEY `ACT_IDX_HI_OP_LOG_USER_ID` (`USER_ID_`),
  KEY `ACT_IDX_HI_OP_LOG_OP_TYPE` (`OPERATION_TYPE_`),
  KEY `ACT_IDX_HI_OP_LOG_ENTITY_TYPE` (`ENTITY_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_op_log` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_CASE_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_INST_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
  KEY `ACT_IDX_HI_PRO_INST_PROC_TIME` (`START_TIME_`,`END_TIME_`),
  KEY `ACT_IDX_HI_PI_PDEFID_END_TIME` (`PROC_DEF_ID_`,`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_INST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FOLLOW_UP_DATE_` datetime DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASKINST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_TASK_INST_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
  KEY `ACT_IDX_HI_TASKINST_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_TASKINSTID_PROCINST` (`ID_`,`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_TASK_INST_RM_TIME` (`REMOVAL_TIME_`),
  KEY `ACT_IDX_HI_TASK_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_TASK_INST_END` (`END_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `STATE_` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_VARINST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_CASEVAR_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_HI_VAR_INST_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_HI_VAR_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
  KEY `ACT_IDX_HI_VARINST_BYTEAR` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_HI_VARINST_RM_TIME` (`REMOVAL_TIME_`),
  KEY `ACT_IDX_HI_VAR_PI_NAME_TYPE` (`PROC_INST_ID_`,`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('camunda-admin',1,'camunda BPM Administrators','SYSTEM');

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('demo','camunda-admin');

/*Table structure for table `act_id_tenant` */

DROP TABLE IF EXISTS `act_id_tenant`;

CREATE TABLE `act_id_tenant` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_tenant` */

/*Table structure for table `act_id_tenant_member` */

DROP TABLE IF EXISTS `act_id_tenant_member`;

CREATE TABLE `act_id_tenant_member` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_TENANT_MEMB_USER` (`TENANT_ID_`,`USER_ID_`),
  UNIQUE KEY `ACT_UNIQ_TENANT_MEMB_GROUP` (`TENANT_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_TENANT_MEMB_USER` (`USER_ID_`),
  KEY `ACT_FK_TENANT_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_TENANT_MEMB` FOREIGN KEY (`TENANT_ID_`) REFERENCES `act_id_tenant` (`ID_`),
  CONSTRAINT `ACT_FK_TENANT_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_TENANT_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_tenant_member` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SALT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_EXP_TIME_` datetime DEFAULT NULL,
  `ATTEMPTS_` int(11) DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`SALT_`,`LOCK_EXP_TIME_`,`ATTEMPTS_`,`PICTURE_ID_`) values ('demo',1,'超级管理员','超级管理员','demo@localhost','{SHA-512}kZdx03HiR7fMRlzd+5z9LPxVPo0tGB/hUQVEkxfDxyKWS2NGkeM3a/2Mqe38s2bl9LAjMpxevsOGBSsHqDx3Ug==','TpgNSVIT/aGa0bQeJ23nSg==',NULL,NULL,NULL);

/*Table structure for table `act_re_case_def` */

DROP TABLE IF EXISTS `act_re_case_def`;

CREATE TABLE `act_re_case_def` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `HISTORY_TTL_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CASE_DEF_TENANT_ID` (`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_case_def` */

/*Table structure for table `act_re_decision_def` */

DROP TABLE IF EXISTS `act_re_decision_def`;

CREATE TABLE `act_re_decision_def` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEC_REQ_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DEC_REQ_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `HISTORY_TTL_` int(11) DEFAULT NULL,
  `VERSION_TAG_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEC_DEF_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_DEC_DEF_REQ_ID` (`DEC_REQ_ID_`),
  CONSTRAINT `ACT_FK_DEC_REQ` FOREIGN KEY (`DEC_REQ_ID_`) REFERENCES `act_re_decision_req_def` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_decision_def` */

/*Table structure for table `act_re_decision_req_def` */

DROP TABLE IF EXISTS `act_re_decision_req_def`;

CREATE TABLE `act_re_decision_req_def` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEC_REQ_DEF_TENANT_ID` (`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_decision_req_def` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOY_TIME_` datetime DEFAULT NULL,
  `SOURCE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEPLOYMENT_NAME` (`NAME_`),
  KEY `ACT_IDX_DEPLOYMENT_TENANT_ID` (`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`DEPLOY_TIME_`,`SOURCE_`,`TENANT_ID_`) values ('9873359a-d8a6-11eb-b88f-ca09a85df480','test','2021-06-29 14:52:40','本地测试','TEST_TENANT');

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `VERSION_TAG_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `HISTORY_TTL_` int(11) DEFAULT NULL,
  `STARTABLE_` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_PROCDEF_DEPLOYMENT_ID` (`DEPLOYMENT_ID_`),
  KEY `ACT_IDX_PROCDEF_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_PROCDEF_VER_TAG` (`VERSION_TAG_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

/*Table structure for table `act_ru_authorization` */

DROP TABLE IF EXISTS `act_ru_authorization`;

CREATE TABLE `act_ru_authorization` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `TYPE_` int(11) NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_TYPE_` int(11) NOT NULL,
  `RESOURCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PERMS_` int(11) DEFAULT NULL,
  `REMOVAL_TIME_` datetime DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_AUTH_USER` (`USER_ID_`,`TYPE_`,`RESOURCE_TYPE_`,`RESOURCE_ID_`),
  UNIQUE KEY `ACT_UNIQ_AUTH_GROUP` (`GROUP_ID_`,`TYPE_`,`RESOURCE_TYPE_`,`RESOURCE_ID_`),
  KEY `ACT_IDX_AUTH_GROUP_ID` (`GROUP_ID_`),
  KEY `ACT_IDX_AUTH_RESOURCE_ID` (`RESOURCE_ID_`),
  KEY `ACT_IDX_AUTH_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_AUTH_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_authorization` */

insert  into `act_ru_authorization`(`ID_`,`REV_`,`TYPE_`,`GROUP_ID_`,`USER_ID_`,`RESOURCE_TYPE_`,`RESOURCE_ID_`,`PERMS_`,`REMOVAL_TIME_`,`ROOT_PROC_INST_ID_`) values ('2078f04a-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,0,'*',2147483647,NULL,NULL),('20798c8b-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,1,'*',2147483647,NULL,NULL),('207a01bc-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,2,'*',2147483647,NULL,NULL),('207a9dfd-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,3,'*',2147483647,NULL,NULL),('207b885e-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,4,'*',2147483647,NULL,NULL),('207c249f-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,5,'*',2147483647,NULL,NULL),('207cc0e0-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,6,'*',2147483647,NULL,NULL),('207d5d21-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,7,'*',2147483647,NULL,NULL),('207df962-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,8,'*',2147483647,NULL,NULL),('207fce23-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,9,'*',2147483647,NULL,NULL),('20823f24-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,10,'*',2147483647,NULL,NULL),('20830275-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,11,'*',2147483647,NULL,NULL),('208377a6-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,12,'*',2147483647,NULL,NULL),('208413e7-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,13,'*',2147483647,NULL,NULL),('2084b028-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,14,'*',2147483647,NULL,NULL),('20854c69-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,15,'*',2147483647,NULL,NULL),('2085e8aa-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,16,'*',2147483647,NULL,NULL),('208684eb-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,17,'*',2147483647,NULL,NULL),('2086fa1c-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,18,'*',2147483647,NULL,NULL),('2087bd6d-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,19,'*',2147483647,NULL,NULL),('208859ae-c387-11eb-bcb0-ca09a85df480',1,1,'camunda-admin',NULL,20,'*',2147483647,NULL,NULL);

/*Table structure for table `act_ru_batch` */

DROP TABLE IF EXISTS `act_ru_batch`;

CREATE TABLE `act_ru_batch` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOTAL_JOBS_` int(11) DEFAULT NULL,
  `JOBS_CREATED_` int(11) DEFAULT NULL,
  `JOBS_PER_SEED_` int(11) DEFAULT NULL,
  `INVOCATIONS_PER_JOB_` int(11) DEFAULT NULL,
  `SEED_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `MONITOR_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_BATCH_SEED_JOB_DEF` (`SEED_JOB_DEF_ID_`),
  KEY `ACT_IDX_BATCH_MONITOR_JOB_DEF` (`MONITOR_JOB_DEF_ID_`),
  KEY `ACT_IDX_BATCH_JOB_DEF` (`BATCH_JOB_DEF_ID_`),
  CONSTRAINT `ACT_FK_BATCH_JOB_DEF` FOREIGN KEY (`BATCH_JOB_DEF_ID_`) REFERENCES `act_ru_jobdef` (`ID_`),
  CONSTRAINT `ACT_FK_BATCH_MONITOR_JOB_DEF` FOREIGN KEY (`MONITOR_JOB_DEF_ID_`) REFERENCES `act_ru_jobdef` (`ID_`),
  CONSTRAINT `ACT_FK_BATCH_SEED_JOB_DEF` FOREIGN KEY (`SEED_JOB_DEF_ID_`) REFERENCES `act_ru_jobdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_batch` */

/*Table structure for table `act_ru_case_execution` */

DROP TABLE IF EXISTS `act_ru_case_execution`;

CREATE TABLE `act_ru_case_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_CASE_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PREV_STATE_` int(11) DEFAULT NULL,
  `CURRENT_STATE_` int(11) DEFAULT NULL,
  `REQUIRED_` tinyint(1) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CASE_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDX_CASE_EXE_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_FK_CASE_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_CASE_EXE_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_CASE_EXEC_TENANT_ID` (`TENANT_ID_`),
  CONSTRAINT `ACT_FK_CASE_EXE_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_re_case_def` (`ID_`),
  CONSTRAINT `ACT_FK_CASE_EXE_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_ru_case_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_CASE_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_case_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_case_execution` */

/*Table structure for table `act_ru_case_sentry_part` */

DROP TABLE IF EXISTS `act_ru_case_sentry_part`;

CREATE TABLE `act_ru_case_sentry_part` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_EXEC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SENTRY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SOURCE_CASE_EXEC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `STANDARD_EVENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SOURCE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VARIABLE_EVENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VARIABLE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SATISFIED_` tinyint(1) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_CASE_SENTRY_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_FK_CASE_SENTRY_CASE_EXEC` (`CASE_EXEC_ID_`),
  CONSTRAINT `ACT_FK_CASE_SENTRY_CASE_EXEC` FOREIGN KEY (`CASE_EXEC_ID_`) REFERENCES `act_ru_case_execution` (`ID_`),
  CONSTRAINT `ACT_FK_CASE_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_ru_case_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_case_sentry_part` */

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` datetime NOT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_IDX_EVENT_SUBSCR_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_EVT_NAME` (`EVENT_NAME_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_CASE_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_ROOT_PI` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDX_EXEC_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_ext_task` */

DROP TABLE IF EXISTS `act_ru_ext_task`;

CREATE TABLE `act_ru_ext_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `WORKER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOPIC_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `ERROR_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ERROR_DETAILS_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_EXP_TIME_` datetime DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXT_TASK_TOPIC` (`TOPIC_NAME_`),
  KEY `ACT_IDX_EXT_TASK_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_EXT_TASK_PRIORITY` (`PRIORITY_`),
  KEY `ACT_IDX_EXT_TASK_ERR_DETAILS` (`ERROR_DETAILS_ID_`),
  KEY `ACT_IDX_EXT_TASK_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EXT_TASK_ERROR_DETAILS` FOREIGN KEY (`ERROR_DETAILS_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_EXT_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_ext_task` */

/*Table structure for table `act_ru_filter` */

DROP TABLE IF EXISTS `act_ru_filter`;

CREATE TABLE `act_ru_filter` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `RESOURCE_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `QUERY_` longtext COLLATE utf8_bin NOT NULL,
  `PROPERTIES_` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_filter` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_incident` */

DROP TABLE IF EXISTS `act_ru_incident`;

CREATE TABLE `act_ru_incident` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `INCIDENT_TIMESTAMP_` datetime NOT NULL,
  `INCIDENT_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `INCIDENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FAILED_ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ANNOTATION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_INC_CONFIGURATION` (`CONFIGURATION_`),
  KEY `ACT_IDX_INC_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_INC_JOB_DEF` (`JOB_DEF_ID_`),
  KEY `ACT_IDX_INC_CAUSEINCID` (`CAUSE_INCIDENT_ID_`),
  KEY `ACT_IDX_INC_EXID` (`EXECUTION_ID_`),
  KEY `ACT_IDX_INC_PROCDEFID` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INC_PROCINSTID` (`PROC_INST_ID_`),
  KEY `ACT_IDX_INC_ROOTCAUSEINCID` (`ROOT_CAUSE_INCIDENT_ID_`),
  CONSTRAINT `ACT_FK_INC_CAUSE` FOREIGN KEY (`CAUSE_INCIDENT_ID_`) REFERENCES `act_ru_incident` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_INC_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_INC_JOB_DEF` FOREIGN KEY (`JOB_DEF_ID_`) REFERENCES `act_ru_jobdef` (`ID_`),
  CONSTRAINT `ACT_FK_INC_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_INC_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_INC_RCAUSE` FOREIGN KEY (`ROOT_CAUSE_INCIDENT_ID_`) REFERENCES `act_ru_incident` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_incident` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` datetime DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FAILED_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REPEAT_OFFSET_` bigint(20) DEFAULT '0',
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NOT NULL DEFAULT '1',
  `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` bigint(20) NOT NULL DEFAULT '0',
  `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXECUTION_ID` (`EXECUTION_ID_`),
  KEY `ACT_IDX_JOB_HANDLER` (`HANDLER_TYPE_`(100),`HANDLER_CFG_`(155)),
  KEY `ACT_IDX_JOB_PROCINST` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_IDX_JOB_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_JOB_JOB_DEF_ID` (`JOB_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_HANDLER_TYPE` (`HANDLER_TYPE_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_jobdef` */

DROP TABLE IF EXISTS `act_ru_jobdef`;

CREATE TABLE `act_ru_jobdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `JOB_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `JOB_CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `JOB_PRIORITY_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOBDEF_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_JOBDEF_PROC_DEF_ID` (`PROC_DEF_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_jobdef` */

/*Table structure for table `act_ru_meter_log` */

DROP TABLE IF EXISTS `act_ru_meter_log`;

CREATE TABLE `act_ru_meter_log` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REPORTER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` bigint(20) DEFAULT NULL,
  `TIMESTAMP_` datetime DEFAULT NULL,
  `MILLISECONDS_` bigint(20) DEFAULT '0',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_METER_LOG_MS` (`MILLISECONDS_`),
  KEY `ACT_IDX_METER_LOG_NAME_MS` (`NAME_`,`MILLISECONDS_`),
  KEY `ACT_IDX_METER_LOG_REPORT` (`NAME_`,`REPORTER_`,`MILLISECONDS_`),
  KEY `ACT_IDX_METER_LOG_TIME` (`TIMESTAMP_`),
  KEY `ACT_IDX_METER_LOG` (`NAME_`,`TIMESTAMP_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_meter_log` */

insert  into `act_ru_meter_log`(`ID_`,`NAME_`,`REPORTER_`,`VALUE_`,`TIMESTAMP_`,`MILLISECONDS_`) values ('00435eb4-c41e-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('00435eb5-c41e-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('00435eb6-c41e-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('00435eb7-c41e-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('00435eb8-c41e-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('00435eb9-c41e-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('00435eba-c41e-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('00435ebb-c41e-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('00435ebc-c41e-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('00435ebd-c41e-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('00435ebe-c41e-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('00435ebf-c41e-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 11:44:30',1622691869739),('09481a74-c3b1-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('09481a75-c3b1-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('09481a76-c3b1-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('09481a77-c3b1-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('09481a78-c3b1-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('09481a79-c3b1-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('09481a7a-c3b1-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('09481a7b-c3b1-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('09481a7c-c3b1-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('09481a7d-c3b1-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('09481a7e-c3b1-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('09481a7f-c3b1-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 22:44:30',1622645069727),('0a909c00-c3dd-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0a909c01-c3dd-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0a909c02-c3dd-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0a909c03-c3dd-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0a909c04-c3dd-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0a909c05-c3dd-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0a909c06-c3dd-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0a909c07-c3dd-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0a909c08-c3dd-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0a909c09-c3dd-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0a909c0a-c3dd-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0a909c0b-c3dd-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 03:59:30',1622663969737),('0bd6857c-c409-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0bd6857d-c409-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0bd6857e-c409-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0bd6857f-c409-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0bd68580-c409-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0bd68581-c409-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0bd68582-c409-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0bd68583-c409-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0bd68584-c409-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0bd68585-c409-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0bd68586-c409-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0bd68587-c409-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 09:14:30',1622682869725),('0c7a631f-d8a6-11eb-97c9-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0c7a8a30-d8a6-11eb-97c9-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0c7a8a31-d8a6-11eb-97c9-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0c7a8a32-d8a6-11eb-97c9-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0c7a8a33-d8a6-11eb-97c9-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0c7a8a34-d8a6-11eb-97c9-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0c7a8a35-d8a6-11eb-97c9-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0c7a8a36-d8a6-11eb-97c9-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0c7a8a37-d8a6-11eb-97c9-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0c7a8a38-d8a6-11eb-97c9-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0c7a8a39-d8a6-11eb-97c9-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0c7a8a3a-d8a6-11eb-97c9-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-29 14:48:45',1624949325044),('0d1f0708-c435-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('0d1f0709-c435-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('0d1f070a-c435-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('0d1f070b-c435-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('0d1f070c-c435-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('0d1f070d-c435-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('0d1f070e-c435-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('0d1f070f-c435-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('0d1f0710-c435-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('0d1f0711-c435-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('0d1f0712-c435-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('0d1f0713-c435-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 14:29:30',1622701769738),('14de768c-c39c-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('14de768d-c39c-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('14de768e-c39c-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('14de768f-c39c-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('14de7690-c39c-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('14de7691-c39c-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('14de7692-c39c-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('14de7693-c39c-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('14de7694-c39c-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('14de7695-c39c-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('14de7696-c39c-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('14de7697-c39c-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 20:14:30',1622636069737),('16246008-c3c8-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('16246009-c3c8-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('1624600a-c3c8-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('1624600b-c3c8-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('1624600c-c3c8-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('1624600d-c3c8-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('1624600e-c3c8-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('1624600f-c3c8-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('16246010-c3c8-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('16246011-c3c8-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('16246012-c3c8-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('16246013-c3c8-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 01:29:30',1622654969729),('176b0cd4-c3f4-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('176b0cd5-c3f4-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('176b0cd6-c3f4-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('176b0cd7-c3f4-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('176b0cd8-c3f4-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('176b0cd9-c3f4-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('176b0cda-c3f4-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('176b0cdb-c3f4-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('176b0cdc-c3f4-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('176b0cdd-c3f4-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('176b0cde-c3f4-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('176b0cdf-c3f4-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 06:44:30',1622673869725),('18b36750-c420-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('18b36751-c420-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('18b36752-c420-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('18b36753-c420-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('18b36754-c420-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('18b36755-c420-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('18b36756-c420-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('18b36757-c420-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('18b36758-c420-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('18b36759-c420-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('18b3675a-c420-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('18b3675b-c420-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 11:59:30',1622692769733),('21ba45f0-c3b3-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('21ba45f1-c3b3-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('21ba45f2-c3b3-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('21ba45f3-c3b3-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('21ba45f4-c3b3-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('21ba45f5-c3b3-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('21ba45f6-c3b3-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('21ba45f7-c3b3-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('21ba45f8-c3b3-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('21ba45f9-c3b3-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('21ba45fa-c3b3-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('21ba45fb-c3b3-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 22:59:30',1622645969734),('2301dd1c-c3df-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('2301dd1d-c3df-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('2301dd1e-c3df-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('2301dd1f-c3df-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('2301dd20-c3df-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('2301dd21-c3df-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('2301dd22-c3df-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('2301dd23-c3df-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('2301dd24-c3df-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('2301dd25-c3df-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('2301dd26-c3df-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('2301dd27-c3df-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 04:14:30',1622664869737),('24494d38-c40b-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('24494d39-c40b-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('24494d3a-c40b-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('24494d3b-c40b-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('24494d3c-c40b-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('24494d3d-c40b-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('24494d3e-c40b-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('24494d3f-c40b-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('24494d40-c40b-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('24494d41-c40b-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('24494d42-c40b-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('24494d43-c40b-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 09:29:30',1622683769738),('258f5dc4-c437-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('258f5dc5-c437-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('258f5dc6-c437-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('258f5dc7-c437-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('258f5dc8-c437-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('258f5dc9-c437-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('258f5dca-c437-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('258f5dcb-c437-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('258f5dcc-c437-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('258f5dcd-c437-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('258f5dce-c437-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('258f5dcf-c437-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 14:44:30',1622702669732),('2d4e7e28-c39e-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2d4e7e29-c39e-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2d4e7e2a-c39e-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2d4e7e2b-c39e-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2d4e7e2c-c39e-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2d4e7e2d-c39e-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2d4e7e2e-c39e-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2d4e7e2f-c39e-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2d4e7e30-c39e-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2d4e7e31-c39e-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2d4e7e32-c39e-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2d4e7e33-c39e-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 20:29:30',1622636969730),('2e9726c4-c3ca-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2e9726c5-c3ca-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2e9726c6-c3ca-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2e9726c7-c3ca-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2e9726c8-c3ca-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2e9726c9-c3ca-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2e9726ca-c3ca-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2e9726cb-c3ca-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2e9726cc-c3ca-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2e9726cd-c3ca-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2e9726ce-c3ca-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2e9726cf-c3ca-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 01:44:30',1622655869740),('2fdcc220-c3f6-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('2fdcc221-c3f6-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('2fdcc222-c3f6-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('2fdcc223-c3f6-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('2fdcc224-c3f6-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('2fdcc225-c3f6-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('2fdcc226-c3f6-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('2fdcc227-c3f6-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('2fdcc228-c3f6-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('2fdcc229-c3f6-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('2fdcc22a-c3f6-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('2fdcc22b-c3f6-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 06:59:30',1622674769729),('31251d9c-c422-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('31251d9d-c422-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('31251d9e-c422-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('31251d9f-c422-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('31251da0-c422-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('31251da1-c422-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('31251da2-c422-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('31251da3-c422-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('31251da4-c422-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('31251da5-c422-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('31251da6-c422-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('31251da7-c422-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 12:14:30',1622693669737),('38e3c8d0-c389-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('38e3c8d1-c389-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('38e3c8d2-c389-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('38e3c8d3-c389-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('38e3c8d4-c389-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('38e3c8d5-c389-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('38e3c8d6-c389-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('38e3c8d7-c389-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('38e3c8d8-c389-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('38e3c8d9-c389-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('38e3c8da-c389-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('38e3c8db-c389-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 17:59:30',1622627969731),('3a2a006c-c3b5-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3a2a006d-c3b5-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3a2a006e-c3b5-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3a2a006f-c3b5-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3a2a0070-c3b5-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3a2a0071-c3b5-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3a2a0072-c3b5-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3a2a0073-c3b5-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3a2a0074-c3b5-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3a2a0075-c3b5-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3a2a0076-c3b5-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3a2a0077-c3b5-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 23:14:30',1622646869726),('3b731e38-c3e1-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3b731e39-c3e1-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3b731e3a-c3e1-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3b731e3b-c3e1-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3b731e3c-c3e1-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3b731e3d-c3e1-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3b731e3e-c3e1-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3b731e3f-c3e1-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3b731e40-c3e1-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3b731e41-c3e1-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3b731e42-c3e1-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3b731e43-c3e1-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 04:29:30',1622665769738),('3cb9f214-c40d-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3cb9f215-c40d-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3cb9f216-c40d-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3cb9f217-c40d-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3cb9f218-c40d-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3cb9f219-c40d-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3cb9f21a-c40d-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3cb9f21b-c40d-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3cb9f21c-c40d-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3cb9f21d-c40d-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3cb9f21e-c40d-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3cb9f21f-c40d-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 09:44:30',1622684669732),('3e011410-c439-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('3e011411-c439-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('3e011412-c439-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('3e011413-c439-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('3e011414-c439-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('3e011415-c439-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('3e011416-c439-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('3e011417-c439-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('3e011418-c439-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('3e011419-c439-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('3e01141a-c439-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('3e01141b-c439-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 14:59:30',1622703569736),('459c7e4f-d8a1-11eb-b8af-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('459c7e50-d8a1-11eb-b8af-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('459c7e51-d8a1-11eb-b8af-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('459c7e52-d8a1-11eb-b8af-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('459c7e53-d8a1-11eb-b8af-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('459c7e54-d8a1-11eb-b8af-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('459c7e55-d8a1-11eb-b8af-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('459c7e56-d8a1-11eb-b8af-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('459c7e57-d8a1-11eb-b8af-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('459c7e58-d8a1-11eb-b8af-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('459c7e59-d8a1-11eb-b8af-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('459c7e5a-d8a1-11eb-b8af-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-29 14:14:33',1624947273412),('45bf9834-c3a0-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('45bf9835-c3a0-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('45bf9836-c3a0-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('45bf9837-c3a0-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('45bf9838-c3a0-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('45bf9839-c3a0-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('45bfbf4a-c3a0-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('45bfbf4b-c3a0-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('45bfbf4c-c3a0-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('45bfbf4d-c3a0-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('45bfbf4e-c3a0-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('45bfbf4f-c3a0-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 20:44:30',1622637869729),('47077d80-c3cc-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('47077d81-c3cc-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('47077d82-c3cc-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('47077d83-c3cc-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('47077d84-c3cc-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('47077d85-c3cc-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('47077d86-c3cc-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('47077d87-c3cc-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('47077d88-c3cc-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('47077d89-c3cc-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('47077d8a-c3cc-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('47077d8b-c3cc-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 01:59:30',1622656769734),('484d3fec-c3f8-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('484d3fed-c3f8-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('484d3fee-c3f8-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('484d3fef-c3f8-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('484d3ff0-c3f8-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('484d3ff1-c3f8-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('484d3ff2-c3f8-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('484d3ff3-c3f8-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('484d3ff4-c3f8-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('484d3ff5-c3f8-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('484d3ff6-c3f8-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('484d3ff7-c3f8-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 07:14:30',1622675669725),('499636a8-c424-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('499636a9-c424-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('499636aa-c424-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('499636ab-c424-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('499636ac-c424-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('499636ad-c424-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('499636ae-c424-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('499636af-c424-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('499636b0-c424-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('499636b1-c424-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('499636b2-c424-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('499636b3-c424-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 12:29:30',1622694569738),('50e0ea48-d8a6-11eb-a7dd-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('50e0ea49-d8a6-11eb-a7dd-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('50e0ea4a-d8a6-11eb-a7dd-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('50e0ea4b-d8a6-11eb-a7dd-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('50e0ea4c-d8a6-11eb-a7dd-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('50e0ea4d-d8a6-11eb-a7dd-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('50e0ea4e-d8a6-11eb-a7dd-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('50e0ea4f-d8a6-11eb-a7dd-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('50e0ea50-d8a6-11eb-a7dd-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('50e0ea51-d8a6-11eb-a7dd-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('50e0ea52-d8a6-11eb-a7dd-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('50e0ea53-d8a6-11eb-a7dd-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-29 14:50:40',1624949439799),('5156426c-c38b-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('5156426d-c38b-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('5156426e-c38b-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('5156426f-c38b-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('51564270-c38b-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('51564271-c38b-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('51564272-c38b-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('51564273-c38b-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('51564274-c38b-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('51564275-c38b-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('51564276-c38b-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('51564277-c38b-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 18:14:30',1622628869740),('529af368-c3b7-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('529af369-c3b7-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('529af36a-c3b7-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('529af36b-c3b7-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('529af36c-c3b7-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('529af36d-c3b7-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('529af36e-c3b7-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('529af36f-c3b7-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('529af370-c3b7-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('529af371-c3b7-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('529af372-c3b7-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('529af373-c3b7-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 23:29:30',1622647769725),('53e45f54-c3e3-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('53e45f55-c3e3-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('53e45f56-c3e3-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('53e45f57-c3e3-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('53e45f58-c3e3-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('53e45f59-c3e3-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('53e45f5a-c3e3-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('53e45f5b-c3e3-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('53e45f5c-c3e3-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('53e45f5d-c3e3-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('53e45f5e-c3e3-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('53e45f5f-c3e3-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 04:44:30',1622666669740),('552ba860-c40f-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('552ba861-c40f-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('552ba862-c40f-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('552ba863-c40f-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('552ba864-c40f-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('552ba865-c40f-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('552ba866-c40f-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('552ba867-c40f-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('552ba868-c40f-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('552ba869-c40f-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('552ba86a-c40f-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('552ba86b-c40f-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 09:59:30',1622685569740),('5672552c-c43b-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('5672552d-c43b-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('5672552e-c43b-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('5672552f-c43b-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('56725530-c43b-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('56725531-c43b-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('56725532-c43b-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('56725533-c43b-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('56725534-c43b-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('56725535-c43b-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('56725536-c43b-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('56725537-c43b-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 15:14:30',1622704469737),('5e31eac0-c3a2-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5e31eac1-c3a2-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5e31eac2-c3a2-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5e31eac3-c3a2-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5e31eac4-c3a2-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5e31eac5-c3a2-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5e31eac6-c3a2-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5e31eac7-c3a2-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5e31eac8-c3a2-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5e31eac9-c3a2-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5e31eaca-c3a2-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5e31eacb-c3a2-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 20:59:30',1622638769737),('5f78225c-c3ce-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('5f78225d-c3ce-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('5f78225e-c3ce-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('5f78225f-c3ce-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('5f782260-c3ce-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('5f782261-c3ce-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('5f782262-c3ce-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('5f782263-c3ce-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('5f782264-c3ce-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('5f782265-c3ce-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('5f782266-c3ce-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('5f782267-c3ce-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 02:14:30',1622657669729),('60be32e8-c3fa-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('60be32e9-c3fa-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('60be32ea-c3fa-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('60be32eb-c3fa-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('60be32ec-c3fa-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('60be32ed-c3fa-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('60be32ee-c3fa-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('60be32ef-c3fa-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('60be32f0-c3fa-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('60be32f1-c3fa-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('60be32f2-c3fa-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('60be32f3-c3fa-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 07:29:30',1622676569725),('6205ca14-c426-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('6205ca15-c426-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('6205ca16-c426-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('6205ca17-c426-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('6205ca18-c426-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('6205ca19-c426-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('6205ca1a-c426-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('6205ca1b-c426-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('6205ca1c-c426-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('6205ca1d-c426-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('6205ca1e-c426-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('6205ca1f-c426-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 12:44:30',1622695469727),('64f519cd-d8a5-11eb-acf2-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('64f519ce-d8a5-11eb-acf2-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('64f519cf-d8a5-11eb-acf2-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('64f519d0-d8a5-11eb-acf2-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('64f519d1-d8a5-11eb-acf2-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('64f519d2-d8a5-11eb-acf2-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('64f519d3-d8a5-11eb-acf2-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('64f519d4-d8a5-11eb-acf2-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('64f519d5-d8a5-11eb-acf2-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('64f519d6-d8a5-11eb-acf2-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('64f519d7-d8a5-11eb-acf2-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('64f519d8-d8a5-11eb-acf2-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-29 14:44:04',1624949043991),('67160fe1-d8a3-11eb-acf2-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('671636f2-d8a3-11eb-acf2-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('671636f3-d8a3-11eb-acf2-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('671636f4-d8a3-11eb-acf2-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('671636f5-d8a3-11eb-acf2-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('671636f6-d8a3-11eb-acf2-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('671636f7-d8a3-11eb-acf2-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('671636f8-d8a3-11eb-acf2-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('671636f9-d8a3-11eb-acf2-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('671636fa-d8a3-11eb-acf2-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('671636fb-d8a3-11eb-acf2-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('671636fc-d8a3-11eb-acf2-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-29 14:29:49',1624948188563),('69c70e58-c38d-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('69c70e59-c38d-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('69c70e5a-c38d-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('69c70e5b-c38d-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('69c70e5c-c38d-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('69c70e5d-c38d-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('69c70e5e-c38d-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('69c70e5f-c38d-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('69c70e60-c38d-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('69c70e61-c38d-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('69c70e62-c38d-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('69c70e63-c38d-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 18:29:30',1622629769738),('6b0d9414-c3b9-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6b0d9415-c3b9-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6b0d9416-c3b9-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6b0d9417-c3b9-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6b0d9418-c3b9-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6b0d9419-c3b9-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6b0d941a-c3b9-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6b0d941b-c3b9-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6b0d941c-c3b9-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6b0d941d-c3b9-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6b0d941e-c3b9-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6b0d941f-c3b9-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 23:44:30',1622648669734),('6c53a4a0-c3e5-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6c53a4a1-c3e5-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6c53a4a2-c3e5-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6c53a4a3-c3e5-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6c53a4a4-c3e5-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6c53a4a5-c3e5-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6c53a4a6-c3e5-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6c53a4a7-c3e5-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6c53a4a8-c3e5-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6c53a4a9-c3e5-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6c53a4aa-c3e5-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6c53a4ab-c3e5-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 04:59:30',1622667569728),('6d9c4d3c-c411-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6d9c4d3d-c411-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6d9c4d3e-c411-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6d9c4d3f-c411-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6d9c4d40-c411-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6d9c4d41-c411-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6d9c4d42-c411-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6d9c4d43-c411-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6d9c4d44-c411-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6d9c4d45-c411-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6d9c4d46-c411-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6d9c4d47-c411-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 10:14:30',1622686469737),('6ee3bd58-c43d-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('6ee3bd59-c43d-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('6ee3bd5a-c43d-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('6ee3bd5b-c43d-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('6ee3bd5c-c43d-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('6ee3bd5d-c43d-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('6ee3bd5e-c43d-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('6ee3bd5f-c43d-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('6ee3bd60-c43d-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('6ee3bd61-c43d-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('6ee3bd62-c43d-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('6ee3bd63-c43d-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 15:29:30',1622705369739),('76a304cc-c3a4-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('76a304cd-c3a4-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('76a304ce-c3a4-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('76a304cf-c3a4-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('76a304d0-c3a4-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('76a304d1-c3a4-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('76a304d2-c3a4-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('76a304d3-c3a4-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('76a304d4-c3a4-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('76a304d5-c3a4-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('76a304d6-c3a4-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('76a304d7-c3a4-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 21:14:30',1622639669737),('77e8ee48-c3d0-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('77e8ee49-c3d0-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('77e8ee4a-c3d0-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('77e8ee4b-c3d0-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('77e8ee4c-c3d0-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('77e8ee4d-c3d0-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('77e8ee4e-c3d0-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('77e8ee4f-c3d0-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('77e8ee50-c3d0-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('77e8ee51-c3d0-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('77e8ee52-c3d0-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('77e8ee53-c3d0-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 02:29:30',1622658569730),('793148c4-c3fc-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('793148c5-c3fc-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('793148c6-c3fc-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('793148c7-c3fc-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('793148c8-c3fc-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('793148c9-c3fc-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('793148ca-c3fc-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('793148cb-c3fc-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('793148cc-c3fc-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('793148cd-c3fc-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('793148ce-c3fc-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('793148cf-c3fc-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 07:44:30',1622677469738),('7a773240-c428-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('7a773241-c428-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('7a773242-c428-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('7a773243-c428-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('7a773244-c428-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('7a773245-c428-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('7a773246-c428-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('7a773247-c428-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('7a773248-c428-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('7a773249-c428-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('7a77324a-c428-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('7a77324b-c428-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 12:59:30',1622696369729),('8237da44-c38f-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('8237da45-c38f-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('8237da46-c38f-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('8237da47-c38f-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('8237da48-c38f-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('8237da49-c38f-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('8237da4a-c38f-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('8237da4b-c38f-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('8237da4c-c38f-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('8237da4d-c38f-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('8237da4e-c38f-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('8237da4f-c38f-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 18:44:30',1622630669736),('837e6000-c3bb-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('837e6001-c3bb-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('837e6002-c3bb-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('837e6003-c3bb-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('837e6004-c3bb-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('837e6005-c3bb-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('837e6006-c3bb-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('837e6007-c3bb-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('837e6008-c3bb-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('837e6009-c3bb-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('837e600a-c3bb-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('837e600b-c3bb-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 23:59:30',1622649569732),('84c6454c-c3e7-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('84c6454d-c3e7-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('84c6454e-c3e7-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('84c6454f-c3e7-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('84c64550-c3e7-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('84c64551-c3e7-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('84c64552-c3e7-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('84c64553-c3e7-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('84c64554-c3e7-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('84c64555-c3e7-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('84c64556-c3e7-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('84c64557-c3e7-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 05:14:30',1622668469737),('860c7ce8-c413-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('860c7ce9-c413-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('860c7cea-c413-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('860c7ceb-c413-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('860c7cec-c413-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('860c7ced-c413-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('860c7cee-c413-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('860c7cef-c413-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('860c7cf0-c413-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('860c7cf1-c413-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('860c7cf2-c413-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('860c7cf3-c413-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 10:29:30',1622687369732),('87546234-c43f-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('87546235-c43f-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('87546236-c43f-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('87546237-c43f-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('87546238-c43f-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('87546239-c43f-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('8754623a-c43f-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('8754623b-c43f-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('8754623c-c43f-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('8754623d-c43f-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('8754623e-c43f-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('8754623f-c43f-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 15:44:30',1622706269736),('8f138298-c3a6-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('8f138299-c3a6-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('8f13829a-c3a6-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('8f13829b-c3a6-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('8f13829c-c3a6-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('8f13829d-c3a6-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('8f13829e-c3a6-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('8f13829f-c3a6-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('8f1382a0-c3a6-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('8f1382a1-c3a6-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('8f1382a2-c3a6-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('8f1382a3-c3a6-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 21:29:30',1622640569733),('905b40d4-c3d2-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('905b40d5-c3d2-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('905b40d6-c3d2-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('905b40d7-c3d2-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('905b40d8-c3d2-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('905b40d9-c3d2-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('905b40da-c3d2-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('905b40db-c3d2-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('905b40dc-c3d2-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('905b40dd-c3d2-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('905b40de-c3d2-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('905b40df-c3d2-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 02:44:30',1622659469737),('91a0b520-c3fe-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('91a0b521-c3fe-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('91a0b522-c3fe-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('91a0b523-c3fe-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('91a0b524-c3fe-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('91a0b525-c3fe-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('91a0b526-c3fe-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('91a0b527-c3fe-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('91a0b528-c3fe-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('91a0b529-c3fe-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('91a0b52a-c3fe-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('91a0b52b-c3fe-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 07:59:30',1622678369726),('92e8253c-c42a-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('92e8253d-c42a-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('92e8253e-c42a-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('92e8253f-c42a-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('92e82540-c42a-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('92e82541-c42a-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('92e82542-c42a-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('92e82543-c42a-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('92e82544-c42a-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('92e82545-c42a-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('92e82546-c42a-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('92e82547-c42a-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 13:14:30',1622697269729),('9aa94270-c391-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9aa94271-c391-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9aa94272-c391-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9aa94273-c391-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9aa94274-c391-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9aa94275-c391-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9aa94276-c391-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9aa94277-c391-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9aa94278-c391-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9aa94279-c391-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9aa9427a-c391-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9aa9427b-c391-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 18:59:30',1622631569739),('9bf08b7c-c3bd-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9bf08b7d-c3bd-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9bf08b7e-c3bd-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9bf08b7f-c3bd-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9bf08b80-c3bd-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9bf08b81-c3bd-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9bf08b82-c3bd-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9bf08b83-c3bd-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9bf08b84-c3bd-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9bf08b85-c3bd-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9bf08b86-c3bd-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9bf08b87-c3bd-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 00:14:30',1622650469737),('9d37ad78-c3e9-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9d37ad79-c3e9-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9d37ad7a-c3e9-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9d37ad7b-c3e9-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9d37ad7c-c3e9-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9d37ad7d-c3e9-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9d37ad7e-c3e9-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9d37ad7f-c3e9-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9d37ad80-c3e9-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9d37ad81-c3e9-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9d37ad82-c3e9-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9d37ad83-c3e9-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 05:29:30',1622669369739),('9e7de514-c415-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9e7de515-c415-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9e7de516-c415-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9e7de517-c415-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9e7de518-c415-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9e7de519-c415-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9e7de51a-c415-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9e7de51b-c415-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9e7de51c-c415-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9e7de51d-c415-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9e7de51e-c415-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9e7de51f-c415-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 10:44:30',1622688269733),('9fc5a350-c441-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('9fc5a351-c441-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('9fc5a352-c441-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('9fc5a353-c441-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('9fc5a354-c441-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('9fc5a355-c441-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('9fc5a356-c441-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('9fc5a357-c441-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('9fc5a358-c441-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('9fc5a359-c441-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('9fc5a35a-c441-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('9fc5a35b-c441-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 15:59:30',1622707169737),('a78511d4-c3a8-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a78511d5-c3a8-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a78511d6-c3a8-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a78511d7-c3a8-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a78511d8-c3a8-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a78511d9-c3a8-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a78511da-c3a8-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a78511db-c3a8-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a78538ec-c3a8-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a78538ed-c3a8-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a78538ee-c3a8-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a78538ef-c3a8-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 21:44:30',1622641469737),('a8cc81f0-c3d4-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('a8cc81f1-c3d4-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('a8cc81f2-c3d4-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('a8cc81f3-c3d4-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('a8cc81f4-c3d4-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('a8cc81f5-c3d4-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('a8cc81f6-c3d4-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('a8cc81f7-c3d4-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('a8cc81f8-c3d4-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('a8cc81f9-c3d4-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('a8cc81fa-c3d4-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('a8cc81fb-c3d4-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 02:59:30',1622660369739),('aa137cdc-c400-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('aa137cdd-c400-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('aa137cde-c400-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('aa137cdf-c400-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('aa137ce0-c400-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('aa137ce1-c400-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('aa137ce2-c400-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('aa137ce3-c400-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('aa137ce4-c400-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('aa137ce5-c400-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('aa137ce6-c400-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('aa137ce7-c400-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 08:14:30',1622679269735),('ab59b478-c42c-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('ab59b479-c42c-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('ab59b47a-c42c-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('ab59b47b-c42c-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('ab59b47c-c42c-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('ab59b47d-c42c-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('ab59db8e-c42c-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('ab59db8f-c42c-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('ab59db90-c42c-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('ab59db91-c42c-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('ab59db92-c42c-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('ab59db93-c42c-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 13:29:30',1622698169731),('b31a356c-c393-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b31a356d-c393-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b31a356e-c393-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b31a356f-c393-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b31a3570-c393-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b31a3571-c393-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b31a3572-c393-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b31a3573-c393-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b31a3574-c393-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b31a3575-c393-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b31a3576-c393-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b31a3577-c393-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 19:14:30',1622632469737),('b4615768-c3bf-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b4615769-c3bf-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b461576a-c3bf-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b461576b-c3bf-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b461576c-c3bf-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b461576d-c3bf-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b461576e-c3bf-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b461576f-c3bf-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b4615770-c3bf-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b4615771-c3bf-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b4615772-c3bf-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b4615773-c3bf-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 00:29:30',1622651369737),('b5a6f2c4-c3eb-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b5a6f2c5-c3eb-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b5a6f2c6-c3eb-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b5a6f2c7-c3eb-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b5a6f2c8-c3eb-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b5a6f2c9-c3eb-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b5a6f2ca-c3eb-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b5a6f2cb-c3eb-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b5a6f2cc-c3eb-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b5a6f2cd-c3eb-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b5a6f2ce-c3eb-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b5a6f2cf-c3eb-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 05:44:30',1622670269725),('b6ee62e0-c417-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b6ee62e1-c417-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b6ee62e2-c417-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b6ee62e3-c417-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b6ee62e4-c417-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b6ee62e5-c417-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b6ee62e6-c417-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b6ee62e7-c417-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b6ee62e8-c417-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b6ee62e9-c417-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b6ee62ea-c417-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b6ee62eb-c417-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 10:59:30',1622689169729),('b837599c-c443-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('b837599d-c443-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('b837599e-c443-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('b837599f-c443-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('b83759a0-c443-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('b83759a1-c443-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('b83759a2-c443-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('b83759a3-c443-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('b83759a4-c443-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('b83759a5-c443-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('b83759a6-c443-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('b83759a7-c443-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 16:14:30',1622708069738),('bff652f0-c3aa-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('bff652f1-c3aa-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('bff652f2-c3aa-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('bff652f3-c3aa-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('bff652f4-c3aa-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('bff652f5-c3aa-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('bff652f6-c3aa-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('bff652f7-c3aa-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('bff652f8-c3aa-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('bff652f9-c3aa-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('bff67a0a-c3aa-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('bff67a0b-c3aa-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 21:59:30',1622642369737),('c13ba02c-c3d6-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c13ba02d-c3d6-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c13ba02e-c3d6-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c13ba02f-c3d6-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c13ba030-c3d6-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c13ba031-c3d6-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c13ba032-c3d6-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c13ba033-c3d6-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c13ba034-c3d6-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c13ba035-c3d6-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c13ba036-c3d6-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c13ba037-c3d6-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 03:14:30',1622661269726),('c1c86093-d8a5-11eb-a2b3-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c1c887a4-d8a5-11eb-a2b3-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c1c887a5-d8a5-11eb-a2b3-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c1c887a6-d8a5-11eb-a2b3-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c1c887a7-d8a5-11eb-a2b3-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c1c887a8-d8a5-11eb-a2b3-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c1c887a9-d8a5-11eb-a2b3-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c1c887aa-d8a5-11eb-a2b3-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c1c887ab-d8a5-11eb-a2b3-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c1c887ac-d8a5-11eb-a2b3-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c1c887ad-d8a5-11eb-a2b3-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c1c887ae-d8a5-11eb-a2b3-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-29 14:46:40',1624949199726),('c282e938-c402-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c282e939-c402-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c282e93a-c402-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c282e93b-c402-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c282e93c-c402-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c282e93d-c402-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c282e93e-c402-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c282e93f-c402-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c282e940-c402-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c282e941-c402-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c282e942-c402-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c282e943-c402-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 08:29:30',1622680169726),('c3ca8064-c42e-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('c3ca8065-c42e-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('c3ca8066-c42e-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('c3ca8067-c42e-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('c3ca8068-c42e-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('c3ca8069-c42e-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('c3ca806a-c42e-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('c3ca806b-c42e-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('c3ca806c-c42e-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('c3ca806d-c42e-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('c3ca806e-c42e-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('c3ca806f-c42e-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 13:44:30',1622699069729),('cb8b7688-c395-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('cb8b7689-c395-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('cb8b768a-c395-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('cb8b768b-c395-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('cb8b768c-c395-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('cb8b768d-c395-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('cb8b768e-c395-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('cb8b768f-c395-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('cb8b7690-c395-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('cb8b7691-c395-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('cb8b7692-c395-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('cb8b7693-c395-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 19:29:30',1622633369738),('ccd1ae24-c3c1-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ccd1ae25-c3c1-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ccd1ae26-c3c1-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ccd1ae27-c3c1-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ccd1ae28-c3c1-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ccd1ae29-c3c1-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ccd1ae2a-c3c1-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ccd1ae2b-c3c1-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ccd1ae2c-c3c1-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ccd1ae2d-c3c1-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ccd1ae2e-c3c1-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ccd1ae2f-c3c1-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 00:44:30',1622652269733),('ce1797a0-c3ed-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('ce1797a1-c3ed-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('ce1797a2-c3ed-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('ce1797a3-c3ed-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('ce1797a4-c3ed-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('ce1797a5-c3ed-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('ce1797a6-c3ed-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('ce1797a7-c3ed-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('ce1797a8-c3ed-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('ce1797a9-c3ed-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('ce1797aa-c3ed-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('ce1797ab-c3ed-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 05:59:30',1622671169725),('cf5f7cec-c419-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('cf5f7ced-c419-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('cf5f7cee-c419-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('cf5f7cef-c419-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('cf5f7cf0-c419-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('cf5f7cf1-c419-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('cf5f7cf2-c419-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('cf5f7cf3-c419-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('cf5f7cf4-c419-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('cf5f7cf5-c419-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('cf5f7cf6-c419-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('cf5f7cf7-c419-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 11:14:30',1622690069728),('d0a73b28-c445-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d0a73b29-c445-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d0a73b2a-c445-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d0a73b2b-c445-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d0a73b2c-c445-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d0a73b2d-c445-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d0a73b2e-c445-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d0a73b2f-c445-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d0a73b30-c445-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d0a73b31-c445-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d0a73b32-c445-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d0a73b33-c445-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 16:29:30',1622708969732),('d73ef43c-d8a6-11eb-b88f-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d73ef43d-d8a6-11eb-b88f-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d73ef43e-d8a6-11eb-b88f-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d73ef43f-d8a6-11eb-b88f-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d73ef440-d8a6-11eb-b88f-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d73ef441-d8a6-11eb-b88f-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d73ef442-d8a6-11eb-b88f-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d73ef443-d8a6-11eb-b88f-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d73ef444-d8a6-11eb-b88f-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d73ef445-d8a6-11eb-b88f-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d73ef446-d8a6-11eb-b88f-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d73ef447-d8a6-11eb-b88f-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-29 14:54:25',1624949665232),('d8676cfc-c3ac-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d8676cfd-c3ac-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d8676cfe-c3ac-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d8676cff-c3ac-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d8676d00-c3ac-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d8676d01-c3ac-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d8676d02-c3ac-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d8676d03-c3ac-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d8676d04-c3ac-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d8676d05-c3ac-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d8676d06-c3ac-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d8676d07-c3ac-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 22:14:30',1622643269737),('d9aedd18-c3d8-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('d9aedd19-c3d8-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('d9aedd1a-c3d8-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('d9aedd1b-c3d8-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('d9aedd1c-c3d8-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('d9aedd1d-c3d8-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('d9aedd1e-c3d8-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('d9aedd1f-c3d8-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('d9aedd20-c3d8-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('d9aedd21-c3d8-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('d9aedd22-c3d8-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('d9aedd23-c3d8-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 03:29:30',1622662169739),('daf589e4-c404-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('daf589e5-c404-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('daf589e6-c404-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('daf589e7-c404-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('daf589e8-c404-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('daf589e9-c404-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('daf589ea-c404-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('daf589eb-c404-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('daf589ec-c404-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('daf589ed-c404-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('daf589ee-c404-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('daf589ef-c404-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 08:44:30',1622681069736),('dc3b2540-c430-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('dc3b2541-c430-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('dc3b2542-c430-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('dc3b2543-c430-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('dc3b2544-c430-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('dc3b2545-c430-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('dc3b2546-c430-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('dc3b2547-c430-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('dc3b2548-c430-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('dc3b2549-c430-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('dc3b254a-c430-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('dc3b254b-c430-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 13:59:30',1622699969726),('e3fb5814-c397-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e3fb5815-c397-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e3fb5816-c397-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e3fb5817-c397-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e3fb5818-c397-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e3fb5819-c397-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e3fb581a-c397-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e3fb581b-c397-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e3fb581c-c397-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e3fb581d-c397-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e3fb581e-c397-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e3fb581f-c397-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 19:44:30',1622634269730),('e542ef40-c3c3-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e542ef41-c3c3-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e542ef42-c3c3-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e542ef43-c3c3-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e542ef44-c3c3-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e542ef45-c3c3-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e542ef46-c3c3-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e542ef47-c3c3-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e542ef48-c3c3-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e542ef49-c3c3-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e542ef4a-c3c3-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e542ef4b-c3c3-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 00:59:30',1622653169733),('e68a5f5c-c3ef-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e68a5f5d-c3ef-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e68a5f5e-c3ef-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e68a5f5f-c3ef-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e68a5f60-c3ef-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e68a5f61-c3ef-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e68a5f62-c3ef-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e68a5f63-c3ef-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e68a5f64-c3ef-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e68a5f65-c3ef-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e68a5f66-c3ef-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e68a5f67-c3ef-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 06:14:30',1622672069736),('e7d1cf78-c41b-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e7d1cf79-c41b-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e7d1cf7a-c41b-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e7d1cf7b-c41b-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e7d1cf7c-c41b-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e7d1cf7d-c41b-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e7d1cf7e-c41b-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e7d1cf7f-c41b-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e7d1cf80-c41b-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e7d1cf81-c41b-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e7d1cf82-c41b-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e7d1cf83-c41b-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 11:29:30',1622690969737),('e918a354-c447-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('e918a355-c447-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('e918a356-c447-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('e918a357-c447-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('e918a358-c447-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('e918a359-c447-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('e918a35a-c447-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('e918a35b-c447-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('e918a35c-c447-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('e918ca6d-c447-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('e918ca6e-c447-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('e918ca6f-c447-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 16:44:30',1622709869735),('f0d85ff8-c3ae-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f0d85ff9-c3ae-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f0d85ffa-c3ae-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f0d85ffb-c3ae-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f0d85ffc-c3ae-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f0d85ffd-c3ae-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f0d85ffe-c3ae-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f0d85fff-c3ae-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f0d86000-c3ae-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f0d86001-c3ae-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f0d86002-c3ae-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f0d86003-c3ae-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 22:29:30',1622644169737),('f21fa904-c3da-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f21fa905-c3da-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f21fa906-c3da-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f21fa907-c3da-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f21fa908-c3da-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f21fa909-c3da-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f21fa90a-c3da-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f21fa90b-c3da-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f21fa90c-c3da-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f21fa90d-c3da-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f21fa90e-c3da-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f21fa90f-c3da-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 03:44:30',1622663069737),('f365b990-c406-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f365e0a1-c406-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f365e0a2-c406-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f365e0a3-c406-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f365e0a4-c406-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f365e0a5-c406-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f365e0a6-c406-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f365e0a7-c406-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f365e0a8-c406-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f365e0a9-c406-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f365e0aa-c406-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f365e0ab-c406-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 08:59:30',1622681969730),('f4ad50bc-c432-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('f4ad50bd-c432-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('f4ad50be-c432-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('f4ad50bf-c432-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('f4ad50c0-c432-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('f4ad50c1-c432-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('f4ad50c2-c432-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('f4ad50c3-c432-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('f4ad50c4-c432-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('f4ad50c5-c432-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('f4ad50c6-c432-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('f4ad50c7-c432-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 14:14:30',1622700869725),('fc6c7220-c399-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fc6c7221-c399-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fc6c7222-c399-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fc6c7223-c399-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fc6c7224-c399-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fc6c7225-c399-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fc6c7226-c399-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fc6c7227-c399-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fc6c7228-c399-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fc6c7229-c399-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fc6c722a-c399-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fc6c722b-c399-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-02 19:59:30',1622635169731),('fdb4576c-c3c5-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fdb4576d-c3c5-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fdb4576e-c3c5-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fdb4576f-c3c5-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fdb45770-c3c5-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fdb45771-c3c5-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fdb45772-c3c5-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fdb45773-c3c5-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fdb45774-c3c5-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fdb45775-c3c5-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fdb45776-c3c5-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fdb45777-c3c5-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 01:14:30',1622654069733),('fefb2b48-c3f1-11eb-bcb0-ca09a85df480','root-process-instance-start','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734),('fefb2b49-c3f1-11eb-bcb0-ca09a85df480','activity-instance-start','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734),('fefb2b4a-c3f1-11eb-bcb0-ca09a85df480','job-acquired-failure','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734),('fefb2b4b-c3f1-11eb-bcb0-ca09a85df480','job-locked-exclusive','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734),('fefb2b4c-c3f1-11eb-bcb0-ca09a85df480','job-execution-rejected','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734),('fefb2b4d-c3f1-11eb-bcb0-ca09a85df480','executed-decision-elements','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734),('fefb2b4e-c3f1-11eb-bcb0-ca09a85df480','activity-instance-end','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734),('fefb2b4f-c3f1-11eb-bcb0-ca09a85df480','job-successful','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734),('fefb2b50-c3f1-11eb-bcb0-ca09a85df480','job-acquired-success','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734),('fefb2b51-c3f1-11eb-bcb0-ca09a85df480','job-acquisition-attempt','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734),('fefb2b52-c3f1-11eb-bcb0-ca09a85df480','executed-decision-instances','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734),('fefb2b53-c3f1-11eb-bcb0-ca09a85df480','job-failed','10.6.10.59$default',0,'2021-06-03 06:29:30',1622672969734);

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FOLLOW_UP_DATE_` datetime DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_ASSIGNEE` (`ASSIGNEE_`),
  KEY `ACT_IDX_TASK_OWNER` (`OWNER_`),
  KEY `ACT_IDX_TASK_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TASK_CASE_EXE` (`CASE_EXECUTION_ID_`),
  KEY `ACT_FK_TASK_CASE_DEF` (`CASE_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_re_case_def` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_CASE_EXE` FOREIGN KEY (`CASE_EXECUTION_ID_`) REFERENCES `act_ru_case_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_task_meter_log` */

DROP TABLE IF EXISTS `act_ru_task_meter_log`;

CREATE TABLE `act_ru_task_meter_log` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_HASH_` bigint(20) DEFAULT NULL,
  `TIMESTAMP_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_METER_LOG_TIME` (`TIMESTAMP_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task_meter_log` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `VAR_SCOPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
  `IS_CONCURRENT_LOCAL_` tinyint(4) DEFAULT NULL,
  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_VARIABLE` (`VAR_SCOPE_`,`NAME_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_VARIABLE_TENANT_ID` (`TENANT_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_NAME_TYPE` (`TASK_ID_`,`NAME_`,`TYPE_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_BATCH_ID` (`BATCH_ID_`),
  KEY `ACT_FK_VAR_CASE_EXE` (`CASE_EXECUTION_ID_`),
  KEY `ACT_FK_VAR_CASE_INST` (`CASE_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BATCH` FOREIGN KEY (`BATCH_ID_`) REFERENCES `act_ru_batch` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_CASE_EXE` FOREIGN KEY (`CASE_EXECUTION_ID_`) REFERENCES `act_ru_case_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_ru_case_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `sm_system_department` */

DROP TABLE IF EXISTS `sm_system_department`;

CREATE TABLE `sm_system_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` bigint(20) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `is_root` tinyint(1) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sm_system_department` */

insert  into `sm_system_department`(`id`,`created_by`,`created_date`,`last_modified_by`,`last_modified_date`,`pid`,`name`,`icon`,`is_root`,`code`,`sort`) values (1,NULL,NULL,NULL,NULL,NULL,'summer科技有限工程师',NULL,1,NULL,NULL),(2,NULL,NULL,NULL,NULL,1,'研发中心',NULL,0,NULL,NULL),(3,NULL,NULL,NULL,NULL,1,'销售中心',NULL,0,NULL,NULL);

/*Table structure for table `sm_system_position` */

DROP TABLE IF EXISTS `sm_system_position`;

CREATE TABLE `sm_system_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` bigint(20) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sm_system_position` */

insert  into `sm_system_position`(`id`,`created_by`,`created_date`,`last_modified_by`,`last_modified_date`,`name`,`code`,`department_id`,`type`,`description`,`sort`) values (1,NULL,NULL,NULL,NULL,'软件设计师',NULL,2,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,'软件测试工程师',NULL,2,NULL,NULL,NULL);

/*Table structure for table `sm_system_role` */

DROP TABLE IF EXISTS `sm_system_role`;

CREATE TABLE `sm_system_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` bigint(20) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permission_scope` int(1) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sm_system_role` */

insert  into `sm_system_role`(`id`,`created_by`,`created_date`,`last_modified_by`,`last_modified_date`,`name`,`description`,`permission_scope`,`sort`) values (1,NULL,NULL,NULL,NULL,'超级管理员','超级管理员',NULL,NULL),(2,NULL,NULL,NULL,NULL,'普通员工','普通员工',NULL,NULL);

/*Table structure for table `sm_system_permission` */

DROP TABLE IF EXISTS `sm_system_permission`;

CREATE TABLE `sm_system_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sm_system_permission` */

insert into `sm_system_permission`(`id`,`code`,`name`,`description`) values (1,'ADMIN','管理员权限','管理员权限');

/*Table structure for table `sm_system_role_permission` */

DROP TABLE IF EXISTS `sm_system_role_permission`;

CREATE TABLE `sm_system_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sm_system_role_permission` */

insert into `sm_system_role_permission`(`role_id`,`permission_id`) values (1,1);
/*Table structure for table `sm_system_user_role` */

DROP TABLE IF EXISTS `sm_system_user_role`;

CREATE TABLE `sm_system_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sm_system_user_role` */

insert into `sm_system_user_role`(`user_id`,`role_id`) values (1,1);

/*Table structure for table `sm_system_user` */

DROP TABLE IF EXISTS `sm_system_user`;

CREATE TABLE `sm_system_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` bigint(20) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `job_number` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sm_system_user` */

insert  into `sm_system_user`(`id`,`created_by`,`created_date`,`last_modified_by`,`last_modified_date`,`job_number`,`name`,`account`,`password`,`email`,`phone`,`gender`,`avatar`,`description`,`sort`,`deleted`,`enable`) values (1,NULL,NULL,NULL,NULL,NULL,'lixiaofeng','lixiaofeng','123456','898220389@qq.com','18202818828',1,NULL,NULL,NULL,0,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
