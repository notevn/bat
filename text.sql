select distinct c.cd_sply
  from ((select distinct a.*, b.*
           from ((select distinct WBGJT300.CD_ESTIM_PERSON,
                                  WBGJT008.NM_PERSON,
                                  WBGJT008.NM_DEPART,
                                  WBGJT300.CD_PROCUR_PERSON,
                                  WBGJT300.NM_ARGMET_STAT,
                                  WBGJT300.DT_FIX_EXPEC,
                                  WBGJT300.DT_PRICE_UNDET_WARN,
                                  WBGJT300.DT_DELV,
                                  WBGJT300.CF_TRANSP_METH,
                                  WBGJT300.CD_COSMOS_MAKER,
                                  WBGJT300.CD_MAKER,
                                  WBGJT300.CD_SPLY,
                                  WBGJT000.NM_SPLY_LOCAL,
                                  WBGJT000.MK_SUBCON,
                                  WBGJT300.NO_PARTS,
                                  WBGJT300.NO_ADJ_DIM,
                                  WBGJT300.CD_PROCESS,
                                  WBGJT300.NO_DRAW,
                                  WBGJT300.CD_CHG_HIST_ALL,
                                  WBGJT300.CD_PIECE,
                                  WBGJT300.MK_PRICE_LIMIT,
                                  WBGJT300.CF_RPT_PARTS_ORD
                    from WBGJT300 WBGJT300,
                         WBGJT008 WBGJT008,
                         WBGJT000 WBGJT000,
                         YCGZT001 YCGZT001
                   where WBGJT300.MK_SUM_FLG = '0'
                     and ((WBGJT300.CF_ARGMET_STAT <= '03' and
                         YCGZT001.NM_DATE_KIND is not null and
                         YCGZT001.DT_DATE_SEQ <= '60') or
                         (WBGJT300.Cf_Argmet_Stat = '04' and
                         WBGJT300.MK_PRICE_LIMIT = '1'))
                     and WBGJT000.CD_DATA_CNTL = '0'
                     and WBGJT008.CD_DATA_CNTL = '0'
                     and WBGJT300.DT_FIX_EXPEC = YCGZT001.dt_date
                     and WBGJT300.CD_SPLY = WBGJT000.cd_sply
                     and WBGJT300.CD_SPLY_FACT = WBGJT000.cd_sply_fact
                     and WBGJT300.CD_ESTIM_PERSON = WBGJT008.CD_PERSON
                   group by WBGJT300.CD_ESTIM_PERSON,
                            WBGJT008.NM_PERSON,
                            WBGJT008.NM_DEPART,
                            WBGJT300.CD_PROCUR_PERSON,
                            WBGJT300.NM_ARGMET_STAT,
                            WBGJT300.DT_FIX_EXPEC,
                            WBGJT300.DT_PRICE_UNDET_WARN,
                            WBGJT300.DT_DELV,
                            WBGJT300.CF_TRANSP_METH,
                            WBGJT300.CD_COSMOS_MAKER,
                            WBGJT300.CD_MAKER,
                            WBGJT300.CD_SPLY,
                            WBGJT000.NM_SPLY_LOCAL,
                            WBGJT000.MK_SUBCON,
                            WBGJT300.NO_PARTS,
                            WBGJT300.NO_ADJ_DIM,
                            WBGJT300.CD_PROCESS,
                            WBGJT300.NO_DRAW,
                            WBGJT300.CD_CHG_HIST_ALL,
                            WBGJT300.CD_PIECE,
                            WBGJT300.MK_PRICE_LIMIT,
                            WBGJT300.CF_RPT_PARTS_ORD
                   order by WBGJT300.DT_FIX_EXPEC    asc,
                            WBGJT300.DT_DELV         asc,
                            WBGJT300.CD_SPLY         asc,
                            WBGJT300.NO_PARTS        asc,
                            WBGJT300.NO_ADJ_DIM      asc,
                            WBGJT300.CD_PROCESS      asc,
                            WBGJT300.NO_DRAW         asc,
                            WBGJT300.CD_CHG_HIST_ALL asc,
                            WBGJT300.CD_PIECE        asc) a join
                
                 (select distinct WBGJT005.DT_PRICE_REGIST,
                                  WBGJT005.CD_SPLY,
                                  WBGJT005.NO_PARTS,
                                  WBGJT005.NO_ADJ_DIM,
                                  WBGJT005.CD_PROCESS,
                                  WBGJT005.NO_DRAW,
                                  WBGJT005.CD_CHG_HIST_ALL,
                                  WBGJT005.CD_PIECE,
                                  WBGJT005.MK_PRICE_LIMIT,
                                  WBGJT005.CF_RPT_PARTS_ORD,
                                  WBGJT005.DT_PRICE_CHG,
                                  WBGJT005.PR_UNIT_PURCH
                  
                    from WBGJT005 WBGJT005, WBGJT300 WBGJT300
                   where
                  
                   WBGJT005.CD_DATA_CNTL = '0'
                and WBGJT005.Cd_Prix_Stand = '0'
                and WBGJT005.MK_PRICE_LIMIT = '1'
                and WBGJT005.MK_PRICE_CLASS = '2'
                and WBGJT300.MK_SUM_FLG = '0'
                and WBGJT300.CF_ARGMET_STAT <= '04'
                and WBGJT300.MK_PRICE_LIMIT <> '9'
                and WBGJT005.CD_SPLY = WBGJT300.cd_sply
                and WBGJT005.NO_PARTS = WBGJT300.no_parts
                and WBGJT005.NO_ADJ_DIM = WBGJT300.NO_ADJ_DIM
                and WBGJT005.CD_PROCESS = WBGJT300.CD_PROCESS
                and WBGJT005.NO_DRAW = WBGJT300.NO_DRAW
                and WBGJT005.CD_CHG_HIST_ALL = WBGJT300.CD_CHG_HIST_ALL
                and WBGJT005.CD_PIECE = WBGJT300.CD_PIECE
                   group by WBGJT005.DT_PRICE_REGIST,
                            WBGJT005.CD_SPLY,
                            WBGJT005.NO_PARTS,
                            WBGJT005.NO_ADJ_DIM,
                            WBGJT005.CD_PROCESS,
                            WBGJT005.NO_DRAW,
                            WBGJT005.CD_CHG_HIST_ALL,
                            WBGJT005.CD_PIECE,
                            WBGJT005.MK_PRICE_LIMIT,
                            WBGJT005.CF_RPT_PARTS_ORD,
                            WBGJT005.DT_PRICE_CHG,
                            WBGJT005.PR_UNIT_PURCH
                   order by WBGJT005.DT_PRICE_REGIST desc,
                            WBGJT005.CD_SPLY         asc,
                            WBGJT005.NO_PARTS        asc,
                            WBGJT005.NO_ADJ_DIM      asc,
                            WBGJT005.CD_PROCESS      asc,
                            WBGJT005.NO_DRAW         asc,
                            WBGJT005.CD_CHG_HIST_ALL asc) b on
                 a.CD_SPLY = b.CD_SPLY and a.NO_PARTS = b.NO_PARTS and
                 a.NO_ADJ_DIM = b.NO_ADJ_DIM and a.NO_DRAW = b.No_Draw and
                 a.CD_CHG_HIST_ALL = b.CD_CHG_HIST_ALL and
                 a.CD_PIECE = b.CD_PIECE)) c
                 join
       
        (select distinct WWCYHV005.RFQ_NO,
                         WWCYHV005.REQUEST_DATE,
                         WWCYHV005.TASK_NAME,
                         WWCYHV005.EFFECTIVE_DATE_QUOTED_PRICE,
                         WWCYHV005.NOMINAL_PROJECT_NAME,
                         WWCYHV005.REMARKS,
                         WWCYHV005.USER_SET_ID_NAME,
                         WWCYHV005.SUPPLIER_CODE,
                         WWCYHV005.GLOBAL_2ND_MANUFACTURER_CODE,
                         WWCYHV005.PART_NO as part,
                         WWCYHV005.DIMENSIONS,
                         WWCYHV005.PROCESS_CODE,
                         WWCYHV005.DRAWING_NO,
                         WWCYHV005.CHANGE_HISTORY_NO,
                         WWCYHV005.UNIT_CODE,
                         WWCYHV005.LIMITED_PRICE_MARK,
                         WWCYHV005.ORDER_CODE
           from MISWWCH2.wwch05@eqeuc WWCYHV005, WBGJT300 WBGJT300
          where WWCYHV005.TYPE_OF_REQUEST = '2'
            and WWCYHV005.LIMITED_PRICE_MARK = '1'
            and WBGJT300.MK_SUM_FLG = '0'
            and WBGJT300.CF_ARGMET_STAT <= '04'
            and WBGJT300.MK_PRICE_LIMIT <> '9'
            and WWCYHV005.PART_NO = WBGJT300.NO_PARTS
            and WWCYHV005.PROCESS_CODE = WBGJT300.CD_PROCESS
            and WWCYHV005.DRAWING_NO = WBGJT300.NO_DRAW
            and WWCYHV005.CHANGE_HISTORY_NO = WBGJT300.CD_CHG_HIST_ALL
            and WWCYHV005.UNIT_CODE = WBGJT300.CD_PIECE
          group by WWCYHV005.RFQ_NO,
                   WWCYHV005.REQUEST_DATE,
                   WWCYHV005.TASK_NAME,
                   WWCYHV005.EFFECTIVE_DATE_QUOTED_PRICE,
                   WWCYHV005.NOMINAL_PROJECT_NAME,
                   WWCYHV005.REMARKS,
                   WWCYHV005.USER_SET_ID_NAME,
                   WWCYHV005.SUPPLIER_CODE,
                   WWCYHV005.GLOBAL_2ND_MANUFACTURER_CODE,
                   WWCYHV005.PART_NO,
                   WWCYHV005.DIMENSIONS,
                   WWCYHV005.PROCESS_CODE,
                   WWCYHV005.DRAWING_NO,
                   WWCYHV005.CHANGE_HISTORY_NO,
                   WWCYHV005.UNIT_CODE,
                   WWCYHV005.LIMITED_PRICE_MARK,
                   WWCYHV005.ORDER_CODE
         
          order by WWCYHV005.REQUEST_DATE                desc,
                   WWCYHV005.EFFECTIVE_DATE_QUOTED_PRICE desc,
                   WWCYHV005.SUPPLIER_CODE               asc,
                   WWCYHV005.PART_NO                     asc,
                   WWCYHV005.DIMENSIONS                  asc,
                   WWCYHV005.PROCESS_CODE                asc,
                   WWCYHV005.DRAWING_NO                  asc,
                   WWCYHV005.CHANGE_HISTORY_NO           asc) d on
        c.CD_SPLY = d.supplier_code and c.NO_PARTS = d.part)
--and c.NO_ADJ_DIM = d.NO_ADJ_DIM
---and c.NO_DRAW = d.drawing_no
--and c.CD_CHG_HIST_ALL = d.CD_CHG_HIST_ALL 
--and c.CD_PIECE = d.CD_PIECE)
