{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Crypto.Proto.BGV.TunnelHint (TunnelHint(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Crypto.Proto.Lol.LinearRq as Crypto.Proto.Lol (LinearRq)
import qualified Crypto.Proto.BGV.KSHint as Crypto.Proto.BGV (KSHint)

data TunnelHint = TunnelHint{func :: !(Crypto.Proto.Lol.LinearRq), hint :: !(P'.Seq Crypto.Proto.BGV.KSHint), e :: !(P'.Word32),
                             r :: !(P'.Word32), s :: !(P'.Word32), p :: !(P'.Word64)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable TunnelHint where
  mergeAppend (TunnelHint x'1 x'2 x'3 x'4 x'5 x'6) (TunnelHint y'1 y'2 y'3 y'4 y'5 y'6)
   = TunnelHint (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)

instance P'.Default TunnelHint where
  defaultValue = TunnelHint P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire TunnelHint where
  wireSize ft' self'@(TunnelHint x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeRep 1 11 x'2 + P'.wireSizeReq 1 13 x'3 + P'.wireSizeReq 1 13 x'4 +
             P'.wireSizeReq 1 13 x'5
             + P'.wireSizeReq 1 4 x'6)
  wirePut ft' self'@(TunnelHint x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 10 11 x'1
             P'.wirePutRep 18 11 x'2
             P'.wirePutReq 24 13 x'3
             P'.wirePutReq 32 13 x'4
             P'.wirePutReq 40 13 x'5
             P'.wirePutReq 48 4 x'6
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{func = P'.mergeAppend (func old'Self) (new'Field)}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{hint = P'.append (hint old'Self) new'Field}) (P'.wireGet 11)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{e = new'Field}) (P'.wireGet 13)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{r = new'Field}) (P'.wireGet 13)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{s = new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{p = new'Field}) (P'.wireGet 4)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TunnelHint) TunnelHint where
  getVal m' f' = f' m'

instance P'.GPB TunnelHint

instance P'.ReflectDescriptor TunnelHint where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10, 24, 32, 40, 48]) (P'.fromDistinctAscList [10, 18, 24, 32, 40, 48])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".crypto.proto.BGV.TunnelHint\", haskellPrefix = [], parentModule = [MName \"Crypto\",MName \"Proto\",MName \"BGV\"], baseName = MName \"TunnelHint\"}, descFilePath = [\"Crypto\",\"Proto\",\"BGV\",\"TunnelHint.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".crypto.proto.BGV.TunnelHint.func\", haskellPrefix' = [], parentModule' = [MName \"Crypto\",MName \"Proto\",MName \"BGV\",MName \"TunnelHint\"], baseName' = FName \"func\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".crypto.proto.lol.LinearRq\", haskellPrefix = [], parentModule = [MName \"Crypto\",MName \"Proto\",MName \"Lol\"], baseName = MName \"LinearRq\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".crypto.proto.BGV.TunnelHint.hint\", haskellPrefix' = [], parentModule' = [MName \"Crypto\",MName \"Proto\",MName \"BGV\",MName \"TunnelHint\"], baseName' = FName \"hint\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".crypto.proto.BGV.KSHint\", haskellPrefix = [], parentModule = [MName \"Crypto\",MName \"Proto\",MName \"BGV\"], baseName = MName \"KSHint\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".crypto.proto.BGV.TunnelHint.e\", haskellPrefix' = [], parentModule' = [MName \"Crypto\",MName \"Proto\",MName \"BGV\",MName \"TunnelHint\"], baseName' = FName \"e\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".crypto.proto.BGV.TunnelHint.r\", haskellPrefix' = [], parentModule' = [MName \"Crypto\",MName \"Proto\",MName \"BGV\",MName \"TunnelHint\"], baseName' = FName \"r\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".crypto.proto.BGV.TunnelHint.s\", haskellPrefix' = [], parentModule' = [MName \"Crypto\",MName \"Proto\",MName \"BGV\",MName \"TunnelHint\"], baseName' = FName \"s\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".crypto.proto.BGV.TunnelHint.p\", haskellPrefix' = [], parentModule' = [MName \"Crypto\",MName \"Proto\",MName \"BGV\",MName \"TunnelHint\"], baseName' = FName \"p\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType TunnelHint where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TunnelHint where
  textPut msg
   = do
       P'.tellT "func" (func msg)
       P'.tellT "hint" (hint msg)
       P'.tellT "e" (e msg)
       P'.tellT "r" (r msg)
       P'.tellT "s" (s msg)
       P'.tellT "p" (p msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'func, parse'hint, parse'e, parse'r, parse's, parse'p]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'func
         = P'.try
            (do
               v <- P'.getT "func"
               Prelude'.return (\ o -> o{func = v}))
        parse'hint
         = P'.try
            (do
               v <- P'.getT "hint"
               Prelude'.return (\ o -> o{hint = P'.append (hint o) v}))
        parse'e
         = P'.try
            (do
               v <- P'.getT "e"
               Prelude'.return (\ o -> o{e = v}))
        parse'r
         = P'.try
            (do
               v <- P'.getT "r"
               Prelude'.return (\ o -> o{r = v}))
        parse's
         = P'.try
            (do
               v <- P'.getT "s"
               Prelude'.return (\ o -> o{s = v}))
        parse'p
         = P'.try
            (do
               v <- P'.getT "p"
               Prelude'.return (\ o -> o{p = v}))
