-- Table: productioncounting_productionbalance
-- changed: 29.03.2012

ALTER TABLE productioncounting_productionbalance ADD COLUMN plannedcyclescosts numeric(10,3);
ALTER TABLE productioncounting_productionbalance ADD COLUMN cyclescosts numeric(10,3);
ALTER TABLE productioncounting_productionbalance ADD COLUMN cyclescostsbalance numeric(10,3);

-- end


-- Table: productioncounting_operationpieceworkcomponent
-- changed: 29.03.2012

CREATE TABLE productioncounting_operationpieceworkcomponent
(
  id bigint NOT NULL,
  productionbalance_id bigint,
  orderoperationcomponent_id bigint,
  plannedcycles integer,
  cycles integer,
  cyclesbalance integer,
  CONSTRAINT productioncounting_operationpieceworkc_pkey PRIMARY KEY (id ),
  CONSTRAINT productioncounting_operationpieceworkc_ooc_fkey FOREIGN KEY (orderoperationcomponent_id)
      REFERENCES productionscheduling_orderoperationcomponent (id) DEFERRABLE,
  CONSTRAINT productioncounting_operationpieceworkc_pb_fkey FOREIGN KEY (productionbalance_id)
      REFERENCES productioncounting_productionbalance (id) DEFERRABLE
);

-- end


-- Table: productioncountingwithcosts_operationpieceworkcostcomponent
-- changed: 29.03.2012

CREATE TABLE productioncountingwithcosts_operationpieceworkcostcomponent
(
  id bigint NOT NULL,
  productionbalance_id bigint,
  orderoperationcomponent_id bigint,
  plannedcyclescosts numeric(10,3),
  cyclescosts numeric(10,3),
  cyclescostsbalance numeric(10,3),
  CONSTRAINT productioncountingwithcosts_operationpieceworkcc_pkey PRIMARY KEY (id ),
  CONSTRAINT productioncountingwithcosts_operationpieceworkcc_ooc_fkey FOREIGN KEY (orderoperationcomponent_id)
      REFERENCES productionscheduling_orderoperationcomponent (id) DEFERRABLE,
  CONSTRAINT productioncountingwithcosts_operationpieceworkcc_pb_fkey FOREIGN KEY (productionbalance_id)
      REFERENCES productioncounting_productionbalance (id) DEFERRABLE
);

-- end
