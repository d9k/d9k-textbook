# Redux-toolkit (RTK)

см. также `rtk-query.md`

## dispatch from extrareducers

```
.addCase(myAsyncThunk.fulfilled, (state) => {
   authSlice.caseReducers.<reducerName>(state, { payload: reducerArg });
})
```

Можно так, а можно прямо из async thunk:

`thunkAPI.dispatch(slice.actions.<reducerName>(reducerArg))`

https://stackoverflow.com/questions/70663663/pros-cons-of-using-extra-reducers-vs-dispatching-within-async-thunk