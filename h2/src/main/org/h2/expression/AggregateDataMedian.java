package org.h2.expression;

import org.h2.engine.Database;
import org.h2.util.Permutations;
import org.h2.util.ValueHashMap;
import org.h2.value.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;

/**
 * Created by rlguarino on 11/5/2015.
 */
public class AggregateDataMedian extends AggregateData {
    private ArrayList<Value> list;
    private ValueHashMap<AggregateDataMedian> distinctValues;

    @Override
    void add(Database database, int dataType, boolean distinct, Value v) {
        v.getInt();
        if (distinct) {
            if (distinctValues == null) {
                distinctValues = ValueHashMap.newInstance();
            }
            distinctValues.put(v, this);
            return;
        }
        if (list == null){
            list = new ArrayList<Value>();
        }
        list.add(v);
    }

    @Override
    Value getValue(Database database, int dataType, boolean distinct) {
        if (distinct){
            groupDistinct(database, dataType);
        }
        if (list == null){
            list = new ArrayList<Value>();
        }
        final CompareMode compareMode = database.getCompareMode();
        Object[] values = list.toArray();
        Arrays.sort(values, new Comparator<Object>() {
            @Override
            public int compare(Object v1, Object v2) {
                Value a1 = (Value)v1;
                Value a2 = (Value)v2;
                return a1.compareTo(a2, compareMode);
            }
        });

        Double N = new Double(list.size());
        Double RN = new Double(0.5*N);
        Double FRN = java.lang.Math.floor(RN);
        Double CRN = java.lang.Math.ceil(RN);
        if (N == 0) {
            return ValueNull.INSTANCE;
        }
        if (N % 2 != 0){
            return (Value)values[FRN.intValue()];
        } else {
            Value sum = (Value)values[RN.intValue()-1];
            sum = sum.add((Value)values[RN.intValue()]);
            return divide(sum, 2);
        }
    }

    private static Value divide(Value a, long by) {
        if (by == 0) {
            return ValueNull.INSTANCE;
        }
        int type = Value.getHigherOrder(a.getType(), Value.LONG);
        Value b = ValueLong.get(by).convertTo(type);
        a = a.convertTo(type).divide(b);
        return a;
    }

    private void groupDistinct(Database database, int dataType){
        if (distinctValues == null){
            return;
        }
        list.clear();
        for( Value v: distinctValues.keys()){
            add(database, dataType, false, v);
        }
    }
}
