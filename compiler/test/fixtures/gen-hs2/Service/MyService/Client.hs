-----------------------------------------------------------------
-- Autogenerated by Thrift
--
-- DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
--  @generated
-----------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-overlapping-patterns#-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns#-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
module Service.MyService.Client
       (MyService, testFunc, testFuncIO, send_testFunc, _build_testFunc,
        recv_testFunc, _parse_testFunc, x_foo, x_fooIO, send_x_foo,
        _build_x_foo, recv_x_foo, _parse_x_foo)
       where
import qualified Control.Arrow as Arrow
import qualified Control.Concurrent as Concurrent
import qualified Control.Exception as Exception
import qualified Control.Monad as Monad
import qualified Control.Monad.Trans.Class as Trans
import qualified Control.Monad.Trans.Reader as Reader
import qualified Data.ByteString.Builder as ByteString
import qualified Data.ByteString.Lazy as LBS
import qualified Data.HashMap.Strict as HashMap
import qualified Data.Int as Int
import qualified Data.List as List
import qualified Data.Proxy as Proxy
import qualified Prelude as Prelude
import qualified Thrift.Binary.Parser as Parser
import qualified Thrift.Codegen as Thrift
import qualified Thrift.Protocol.ApplicationException.Types
       as Thrift
import Data.Monoid ((<>))
import Prelude ((==), (=<<), (>>=), (<$>), (.))
import Service.Types

data MyService

testFunc ::
           (Thrift.Protocol p, Thrift.ClientChannel c,
            s Thrift.<: MyService) =>
           Int.Int64 -> Z -> Thrift.ThriftM p c s Int.Int64
testFunc __field__arg1 __field__arg2
  = do Thrift.ThriftEnv _proxy _channel _opts _counter <- Reader.ask
       Trans.lift
         (testFuncIO _proxy _channel _counter _opts __field__arg1
            __field__arg2)

testFuncIO ::
             (Thrift.Protocol p, Thrift.ClientChannel c,
              s Thrift.<: MyService) =>
             Proxy.Proxy p ->
               c s ->
                 Thrift.Counter ->
                   Thrift.RpcOptions -> Int.Int64 -> Z -> Prelude.IO Int.Int64
testFuncIO _proxy _channel _counter _opts __field__arg1
  __field__arg2
  = do (_handle, _sendCob, _recvCob) <- Thrift.mkCallbacks
                                          (recv_testFunc _proxy)
       send_testFunc _proxy _channel _counter _sendCob _recvCob _opts
         __field__arg1
         __field__arg2
       Thrift.wait _handle

send_testFunc ::
                (Thrift.Protocol p, Thrift.ClientChannel c,
                 s Thrift.<: MyService) =>
                Proxy.Proxy p ->
                  c s ->
                    Thrift.Counter ->
                      Thrift.SendCallback ->
                        Thrift.RecvCallback ->
                          Thrift.RpcOptions -> Int.Int64 -> Z -> Prelude.IO ()
send_testFunc _proxy _channel _counter _sendCob _recvCob _rpcOpts
  __field__arg1 __field__arg2
  = do _seqNum <- _counter
       let
         _callMsg
           = LBS.toStrict
               (ByteString.toLazyByteString
                  (_build_testFunc _proxy _seqNum __field__arg1 __field__arg2))
       Thrift.sendRequest _channel
         (Thrift.Request _callMsg
            (Thrift.setRpcPriority _rpcOpts Thrift.NormalPriority))
         _sendCob
         _recvCob

recv_testFunc ::
                (Thrift.Protocol p) =>
                Proxy.Proxy p ->
                  Thrift.Response -> Prelude.Either Exception.SomeException Int.Int64
recv_testFunc _proxy (Thrift.Response _response _)
  = Monad.join
      (Arrow.left (Exception.SomeException . Thrift.ProtocolException)
         (Parser.parse (_parse_testFunc _proxy) _response))

_build_testFunc ::
                  Thrift.Protocol p =>
                  Proxy.Proxy p -> Int.Int32 -> Int.Int64 -> Z -> ByteString.Builder
_build_testFunc _proxy _seqNum __field__arg1 __field__arg2
  = Thrift.genMsgBegin _proxy "testFunc" 1 _seqNum <>
      Thrift.genStruct _proxy
        (Thrift.genFieldPrim _proxy "arg1" (Thrift.getI64Type _proxy) 1 0
           (Thrift.genI64Prim _proxy)
           __field__arg1
           :
           Thrift.genField _proxy "arg2" (Thrift.getStructType _proxy) 2 1
             (Thrift.buildStruct _proxy __field__arg2)
             : [])
      <> Thrift.genMsgEnd _proxy

_parse_testFunc ::
                  Thrift.Protocol p =>
                  Proxy.Proxy p ->
                    Parser.Parser (Prelude.Either Exception.SomeException Int.Int64)
_parse_testFunc _proxy
  = do Thrift.MsgBegin _name _msgTy _ <- Thrift.parseMsgBegin _proxy
       _result <- case _msgTy of
                    1 -> Prelude.fail "testFunc: expected reply but got function call"
                    2 | _name == "testFunc" ->
                        do let
                             _idMap = HashMap.fromList [("testFunc_success", 0)]
                           _fieldBegin <- Thrift.parseFieldBegin _proxy 0 _idMap
                           case _fieldBegin of
                             Thrift.FieldBegin _type _id _bool -> do case _id of
                                                                       0 | _type ==
                                                                             Thrift.getI64Type
                                                                               _proxy
                                                                           ->
                                                                           Prelude.fmap
                                                                             Prelude.Right
                                                                             (Thrift.parseI64
                                                                                _proxy)
                                                                       _ -> Prelude.fail
                                                                              (Prelude.unwords
                                                                                 ["unrecognized exception, type:",
                                                                                  Prelude.show
                                                                                    _type,
                                                                                  "field id:",
                                                                                  Prelude.show _id])
                             Thrift.FieldEnd -> Prelude.fail "no response"
                      | Prelude.otherwise -> Prelude.fail "reply function does not match"
                    3 -> Prelude.fmap (Prelude.Left . Exception.SomeException)
                           (Thrift.parseStruct _proxy ::
                              Parser.Parser Thrift.ApplicationException)
                    4 -> Prelude.fail
                           "testFunc: expected reply but got oneway function call"
                    _ -> Prelude.fail "testFunc: invalid message type"
       Thrift.parseMsgEnd _proxy
       Prelude.return _result

x_foo ::
        (Thrift.Protocol p, Thrift.ClientChannel c,
         s Thrift.<: MyService) =>
        Thrift.ThriftM p c s ()
x_foo
  = do Thrift.ThriftEnv _proxy _channel _opts _counter <- Reader.ask
       Trans.lift (x_fooIO _proxy _channel _counter _opts)

x_fooIO ::
          (Thrift.Protocol p, Thrift.ClientChannel c,
           s Thrift.<: MyService) =>
          Proxy.Proxy p ->
            c s -> Thrift.Counter -> Thrift.RpcOptions -> Prelude.IO ()
x_fooIO _proxy _channel _counter _opts
  = do (_handle, _sendCob, _recvCob) <- Thrift.mkCallbacks
                                          (recv_x_foo _proxy)
       send_x_foo _proxy _channel _counter _sendCob _recvCob _opts
       Thrift.wait _handle

send_x_foo ::
             (Thrift.Protocol p, Thrift.ClientChannel c,
              s Thrift.<: MyService) =>
             Proxy.Proxy p ->
               c s ->
                 Thrift.Counter ->
                   Thrift.SendCallback ->
                     Thrift.RecvCallback -> Thrift.RpcOptions -> Prelude.IO ()
send_x_foo _proxy _channel _counter _sendCob _recvCob _rpcOpts
  = do _seqNum <- _counter
       let
         _callMsg
           = LBS.toStrict
               (ByteString.toLazyByteString (_build_x_foo _proxy _seqNum))
       Thrift.sendRequest _channel
         (Thrift.Request _callMsg
            (Thrift.setRpcPriority _rpcOpts Thrift.NormalPriority))
         _sendCob
         _recvCob

recv_x_foo ::
             (Thrift.Protocol p) =>
             Proxy.Proxy p ->
               Thrift.Response -> Prelude.Either Exception.SomeException ()
recv_x_foo _proxy (Thrift.Response _response _)
  = Monad.join
      (Arrow.left (Exception.SomeException . Thrift.ProtocolException)
         (Parser.parse (_parse_x_foo _proxy) _response))

_build_x_foo ::
               Thrift.Protocol p =>
               Proxy.Proxy p -> Int.Int32 -> ByteString.Builder
_build_x_foo _proxy _seqNum
  = Thrift.genMsgBegin _proxy "foo" 1 _seqNum <>
      Thrift.genStruct _proxy []
      <> Thrift.genMsgEnd _proxy

_parse_x_foo ::
               Thrift.Protocol p =>
               Proxy.Proxy p ->
                 Parser.Parser (Prelude.Either Exception.SomeException ())
_parse_x_foo _proxy
  = do Thrift.MsgBegin _name _msgTy _ <- Thrift.parseMsgBegin _proxy
       _result <- case _msgTy of
                    1 -> Prelude.fail "foo: expected reply but got function call"
                    2 | _name == "foo" ->
                        do let
                             _idMap = HashMap.fromList [("ex", 1)]
                           _fieldBegin <- Thrift.parseFieldBegin _proxy 0 _idMap
                           case _fieldBegin of
                             Thrift.FieldBegin _type _id _bool -> do case _id of
                                                                       1 | _type ==
                                                                             Thrift.getStructType
                                                                               _proxy
                                                                           ->
                                                                           Prelude.fmap
                                                                             (Prelude.Left .
                                                                                Exception.SomeException)
                                                                             (Thrift.parseStruct
                                                                                _proxy
                                                                                :: Parser.Parser Ex)
                                                                       _ -> Prelude.fail
                                                                              (Prelude.unwords
                                                                                 ["unrecognized exception, type:",
                                                                                  Prelude.show
                                                                                    _type,
                                                                                  "field id:",
                                                                                  Prelude.show _id])
                             Thrift.FieldEnd -> Prelude.return (Prelude.Right ())
                      | Prelude.otherwise -> Prelude.fail "reply function does not match"
                    3 -> Prelude.fmap (Prelude.Left . Exception.SomeException)
                           (Thrift.parseStruct _proxy ::
                              Parser.Parser Thrift.ApplicationException)
                    4 -> Prelude.fail
                           "foo: expected reply but got oneway function call"
                    _ -> Prelude.fail "foo: invalid message type"
       Thrift.parseMsgEnd _proxy
       Prelude.return _result